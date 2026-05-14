#!/usr/bin/env -S uv run
"""Fetch an ICS calendar (e.g. from Proton Calendar) and convert to an org-mode file."""
# /// script
# requires-python = ">=3.11"
# dependencies = [
#     "icalendar",
#     "recurring-ical-events",
# ]
# ///

import argparse
import logging
import sys
import traceback
from datetime import date, datetime, timedelta, timezone
from pathlib import Path
from urllib.parse import urlparse
from urllib.request import urlopen, Request
from zoneinfo import ZoneInfo

import recurring_ical_events
from icalendar import Calendar

log = logging.getLogger(__name__)


def get_local_tz() -> ZoneInfo:
    """Detect the system's local timezone."""
    local_dt = datetime.now().astimezone()
    tzname = local_dt.tzinfo.tzname(local_dt)
    # Try to read the actual IANA zone from /etc/timezone (Linux)
    try:
        tz_str = Path("/etc/timezone").read_text().strip()
        return ZoneInfo(tz_str)
    except (FileNotFoundError, KeyError):
        pass
    # Fallback: try the tzname directly (works for some zones)
    try:
        return ZoneInfo(tzname)
    except KeyError:
        return ZoneInfo("UTC")


def fetch_ics(source: str) -> bytes:
    """Fetch ICS data from a URL or local file path."""
    if source.startswith("http://") or source.startswith("https://"):
        req = Request(source, headers={"User-Agent": "proton2org/0.1"})
        with urlopen(req, timeout=30) as resp:
            return resp.read()
    else:
        return Path(source).read_bytes()


def parse_events(
    ics_data: bytes, window_past: int, window_future: int, target_tz: ZoneInfo
) -> list[dict]:
    """Parse ICS data and expand recurring events within the time window.

    All timed events are converted to target_tz. All-day events are left as
    bare dates (timezone is irrelevant for them).

    Returns a sorted list of event dicts with keys:
        summary, dtstart, dtend, location, description, uid, all_day
    """
    cal = Calendar.from_ical(ics_data)

    start = date.today() - timedelta(days=window_past)
    end = date.today() + timedelta(days=window_future)

    raw_events = recurring_ical_events.of(cal).between(start, end)

    events = []
    for ev in raw_events:
        dtstart = ev.get("DTSTART")
        dtend = ev.get("DTEND")
        if dtstart is None:
            continue
        dtstart = dtstart.dt
        dtend = dtend.dt if dtend else None

        all_day = isinstance(dtstart, date) and not isinstance(dtstart, datetime)

        if not all_day:
            # Ensure timezone-aware, then convert to target
            if dtstart.tzinfo is None:
                dtstart = dtstart.replace(tzinfo=timezone.utc)
            dtstart = dtstart.astimezone(target_tz)
            if dtend is not None:
                if dtend.tzinfo is None:
                    dtend = dtend.replace(tzinfo=timezone.utc)
                dtend = dtend.astimezone(target_tz)

        events.append(
            {
                "summary": str(ev.get("SUMMARY", "No title")),
                "dtstart": dtstart,
                "dtend": dtend,
                "location": str(ev.get("LOCATION", "")) or None,
                "description": str(ev.get("DESCRIPTION", "")) or None,
                "uid": str(ev.get("UID", "")),
                "all_day": all_day,
            }
        )

    events.sort(
        key=lambda e: (
            e["dtstart"]
            if isinstance(e["dtstart"], datetime)
            else datetime.combine(
                e["dtstart"], datetime.min.time(), tzinfo=timezone.utc
            )
        )
    )
    return events


def format_org_timestamp(dtstart, dtend, all_day: bool) -> str:
    """Format an org-mode timestamp or time range."""
    if all_day:
        if dtend and (dtend - dtstart).days > 1:
            # Multi-day: org uses inclusive end, ICS uses exclusive end
            end_inclusive = dtend - timedelta(days=1)
            return f"<{dtstart:%Y-%m-%d %a}>--<{end_inclusive:%Y-%m-%d %a}>"
        return f"<{dtstart:%Y-%m-%d %a}>"
    else:
        start_str = f"{dtstart:%Y-%m-%d %a %H:%M}"
        if dtend and dtend.date() == dtstart.date():
            return f"<{start_str}-{dtend:%H:%M}>"
        elif dtend:
            return f"<{start_str}>--<{dtend:%Y-%m-%d %a %H:%M}>"
        return f"<{start_str}>"


def events_to_org(
    events: list[dict], title: str, category: str | None, filetags: str | None
) -> str:
    """Convert a list of event dicts to an org-mode string."""
    lines = [
        f"#+TITLE: {title}",
        "#+STARTUP: overview",
    ]
    if category:
        lines.append(f"#+CATEGORY: {category}")
    if filetags:
        lines.append(f"#+FILETAGS: {filetags}")
    lines.append("")

    for ev in events:
        timestamp = format_org_timestamp(ev["dtstart"], ev["dtend"], ev["all_day"])
        lines.append(f"* {ev['summary']}")
        lines.append(f"{timestamp}")

        props = []
        if ev["location"]:
            props.append(("LOCATION", ev["location"]))
        if ev["uid"]:
            props.append(("UID", ev["uid"]))
        if props:
            lines.append(":PROPERTIES:")
            for key, val in props:
                lines.append(f":{key}: {val}")
            lines.append(":END:")

        if ev["description"]:
            # Indent description body under the heading
            for desc_line in ev["description"].strip().splitlines():
                lines.append(f"{desc_line}")

        lines.append("")

    return "\n".join(lines)


def redact_source(source: str) -> str:
    """Return just the domain for URLs, or the filename for local paths."""
    if source.startswith("http://") or source.startswith("https://"):
        return urlparse(source).hostname or "<unknown host>"
    return Path(source).name


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", help="ICS URL or local file path")
    parser.add_argument("-o", "--output", required=True, help="Output .org file path")
    parser.add_argument(
        "--past", type=int, default=7, help="Days in the past to include (default: 7)"
    )
    parser.add_argument(
        "--future",
        type=int,
        default=360,
        help="Days in the future to include (default: 360)",
    )
    parser.add_argument(
        "--title",
        default="Calendar",
        help="#+TITLE for the org file (default: Calendar)",
    )
    parser.add_argument(
        "--category",
        default=None,
        help="#+CATEGORY for the org file (useful for agenda filtering)",
    )
    parser.add_argument(
        "--filetags",
        default=None,
        help="#+FILETAGS for the org file (useful for agenda filtering)",
    )
    parser.add_argument(
        "--timezone",
        default=None,
        help="IANA timezone for output (e.g. Europe/Berlin). "
        "Defaults to system local timezone.",
    )
    args = parser.parse_args()

    logging.basicConfig(
        format="%(asctime)s %(levelname)s %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
        level=logging.INFO,
    )

    target_tz = ZoneInfo(args.timezone) if args.timezone else get_local_tz()

    log.info(
        "run started: source=%s output=%s window=[-%d,+%d] tz=%s",
        redact_source(args.source),
        args.output,
        args.past,
        args.future,
        target_tz,
    )

    try:
        ics_data = fetch_ics(args.source)
    except Exception:
        log.error("failed to fetch ICS:\n%s", traceback.format_exc())
        sys.exit(1)

    log.info("fetched %d bytes of ICS data", len(ics_data))

    events = parse_events(ics_data, args.past, args.future, target_tz)

    org_text = events_to_org(events, args.title, args.category, args.filetags)

    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(org_text)

    log.info("wrote %d events to %s", len(events), output_path)


if __name__ == "__main__":
    main()
