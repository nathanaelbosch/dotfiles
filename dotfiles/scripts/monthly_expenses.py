#!/usr/bin/env python
"""Read ~/Documents/ausgaben.csv and print the monthly expenses so far"""
import sys
import pandas as pd
import datetime as dt

month = dt.date.today()

# Read Files
ausgaben = pd.read_csv('~/Documents/ausgaben.csv')
ausgaben.date = pd.to_datetime(ausgaben.date)
ausgaben.set_index('date', inplace=True)
einnahmen = pd.read_csv('~/Documents/einnahmen.csv')
einnahmen.date = pd.to_datetime(einnahmen.date)
einnahmen.set_index('date', inplace=True)

# Get expenses
monatsanfang = dt.datetime.now().replace(day=1, hour=0, minute=0, second=0, microsecond=0)
eur_tot = ausgaben.loc[ausgaben.index >= monatsanfang].amount.sum()
eur = eur_tot - 369     # Ohne Miete
n_days = dt.date.today().day
eur_per_day = eur/n_days

# Expenses minus income
einnahmen_monat = einnahmen.loc[einnahmen.index >= monatsanfang].amount.sum()
netto = eur - einnahmen_monat
netto_daily = netto / n_days

# Print results
print('Abzüglich Miete: {:.0f}€'.format(eur))
print('Pro Tag: {:.0f}€'.format(eur_per_day))
print('Einkommen eingerechnet:: {:.0f}€'.format(netto_daily))
sys.exit(0)
