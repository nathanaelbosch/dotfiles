from subprocess import check_output

def get_password(account):
    return check_output("authinfo.sh machine="+account, shell=True).strip(b'\n')
