#!/usr/bin/env python3
import datetime
import requests
from pathlib import Path


def get_price(curr):
    url = f"https://api.kraken.com/0/public/Ticker?pair={curr.lower()}eur"
    r = requests.get(url)
    assert r.ok
    j = r.json()
    price = float(j["result"][f"X{curr.upper()}ZEUR"]["c"][0])
    return price


dt_str = datetime.datetime.now().strftime("%Y/%m/%d %H:%M:%S")
db_str = f"""
P {dt_str} BTC {get_price("xbt")}€
P {dt_str} ETH {get_price("eth")}€
P {dt_str} XMR {get_price("xmr")}€
P {dt_str} ZEC {get_price("zec")}€
"""
print(db_str)

with Path.home().joinpath("MEGA/prices.db").open("w") as f:
    f.write(db_str)
