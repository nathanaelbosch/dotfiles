#!/usr/bin/env python
import requests
import sys

sats = int(sys.argv[1])
url = "https://api.kraken.com/0/public/Ticker?pair=xbteur"
r = requests.get(url)
assert r.ok
j = r.json()
eur_btc = float(j["result"]["XXBTZEUR"]["c"][0])
eur_sat = eur_btc / 1e8
print(f"{eur_sat * sats:.2f}€")
