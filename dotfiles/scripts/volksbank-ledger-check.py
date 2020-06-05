#!/usr/bin/env python
"""Simple check of a csv file against the ledger file

Just to make sure nothing slipped through. It might have a high false-positive
rate, since it only compares some absolute numbers without checking any
additional info, but I think this could be good enough to make sure that I do
not forget any major expense :) Do this once every 4 weeks!
"""
import subprocess
from io import StringIO
import argparse

import pandas as pd


parser = argparse.ArgumentParser()
parser.add_argument("file", help="CSV file to check against the default ledger file")
parser.add_argument("--verbose", "-v", action="store_true", help="More output")
args = parser.parse_args()
VERBOSE = args.verbose
csv_file = args.file


# 1. Read the CSV into a pd.DataFrame
df = pd.read_csv(
    csv_file,
    skiprows=12,
    skipfooter=2,
    skip_blank_lines=True,
    encoding="ISO-8859-1",
    delimiter=";",
    decimal=",",
    thousands=".",
    dtype=dict(Buchungstag=str, Valuta=str),
    engine="python",
)
df.Buchungstag = pd.to_datetime(df.Buchungstag, format="%d%m%Y")
df.Valuta = pd.to_datetime(df.Valuta, format="%d%m%Y")
df["SollHaben"] = df[" "]

df["signed-amount"] = [
    u * (1 if s == "H" else -1) for u, s in zip(df["Umsatz"], df["SollHaben"])
]
df["ledger-string"] = [f"{a:.2f}€" for a in df["signed-amount"]]

if not VERBOSE:
    df.drop(
        [
            "Konto-Nr.",
            "BLZ",
            "Valuta",
            "Kundenreferenz",
            " ",
            "IBAN",
            "BIC",
            "Währung",
            "ledger-string",
            "Umsatz",
            "SollHaben",
        ],
        axis=1,
        inplace=True,
    )

# Check if for each entry there is a corresponding ledger entry
for row in df[::-1].iterrows():
    date = row[1].Buchungstag
    query = [
        "ledger",
        "csv",
        "--begin",
        (date - pd.Timedelta(days=4)).strftime("%Y/%m/%d"),
        "--end",
        (date + pd.Timedelta(days=1)).strftime("%Y/%m/%d"),
    ]
    output = subprocess.check_output(query).decode()
    vb_amount = row[1]["signed-amount"]

    if output != "":
        ledger_df = pd.read_csv(
            StringIO(output),
            names=[
                "Date",
                "unknown1",
                "Name",
                "Category",
                "Currency",
                "Amount",
                "unknown2",
                "unknown3",
            ],
        )
        match = ledger_df[ledger_df.Amount.abs() == abs(vb_amount)]
        if match.empty:
            found = False
        else:
            found = True
    else:
        found = False

    if found:
        if VERBOSE:
            print("Found match:")
            print(match)
    else:
        print("#" * 83)
        print("Looking for:")
        print("#" * 83)
        print(row[1])
        print("#" * 83)
        print("No match found!")
        input("Press any key to contine...")
