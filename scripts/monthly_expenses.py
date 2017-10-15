#!/usr/bin/env python
"""Read ~/Documents/ausgaben.csv and print the monthly expenses so far"""
import sys
import pandas as pd
import datetime as dt

month = dt.date.today()

ausgaben = pd.read_csv('~/Documents/ausgaben.csv')
ausgaben.date = pd.to_datetime(ausgaben.date)
ausgaben.set_index('date', inplace=True)
monatsanfang = dt.datetime.now().replace(day=1, hour=0, minute=0, second=0, microsecond=0)
eur_tot = ausgaben.loc[ausgaben.index >= monatsanfang].amount.sum()
eur = eur_tot - 369     # Ohne Miete
n_days = dt.date.today().day
eur_per_day = eur/n_days
print('Abzüglich Miete: {:.0f}€'.format(eur))
print('Pro Tag: {:.0f}€'.format(eur_per_day))
sys.exit(0)
