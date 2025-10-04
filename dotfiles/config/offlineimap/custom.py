import os
from subprocess import check_output


def get_password(account):
    return check_output("authinfo.sh machine=" + account, shell=True).strip(b"\n")


def get_access_token():
    os.popen(
        "cd /home/user/.config/offlineimap/M365-IMAP/; .venv/bin/python3 refresh_token.py"
    )
    token_file = open(
        "/home/user/.config/offlineimap/M365-IMAP/imap_smtp_access_token", "r"
    )
    data = token_file.read()
    token_file.close()
    return data


def get_refresh_token():
    os.popen(
        "cd /home/user/.config/offlineimap/M365-IMAP/; .venv/bin/python3 refresh_token.py"
    )
    token_file = open(
        "/home/user/.config/offlineimap/M365-IMAP/imap_smtp_refresh_token", "r"
    )
    data = token_file.read()
    token_file.close
    return data
