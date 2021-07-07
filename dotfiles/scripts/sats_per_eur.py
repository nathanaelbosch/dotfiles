#!/usr/bin/env python
import requests
url = "https://api.kraken.com/0/public/Ticker?pair=xbteur"
r = requests.get(url)
assert r.ok
j = r.json()
eur_btc = float(j["result"]["XXBTZEUR"]["c"][0])
sat_eur = int(1 / eur_btc * 1e8)
print(sat_eur)
