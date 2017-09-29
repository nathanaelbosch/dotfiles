#!/usr/bin/env python
"""Simple tool to convert lending rates

Used as I often want to convert daily lending rates into yearly rates while 
adjusting for the poloniex fee"""
import sys

daily_rate = float(sys.argv[1])
# Minus poloniex fees
daily_rate = daily_rate*(1-0.15)
yearly_rate = (((daily_rate/100 + 1) ** 356) - 1) * 100 
print("{:.2f}%".format(yearly_rate))
sys.exit(0)
