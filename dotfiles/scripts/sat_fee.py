#!/usr/bin/env python
import requests

url = "https://mempool.space/api/v1/fees/recommended"
r = requests.get(url)
assert r.ok
j = r.json()
fee = int(j["halfHourFee"])
print(f"{fee} sat/vB")
