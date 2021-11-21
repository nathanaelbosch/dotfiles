#!/bin/sh

echo "Clone the dotfiles repo into ~/dotfiles"
git clone --recursive https://github.com/nathbo/dotfiles.git ~/dotfiles
cd ~/dotfiles

echo "Install the dotdrop requirements into a new venv"
echo ""
python -m venv .venv
. .venv/bin/activate
pip install --user -r dotdrop/requirements.txt

# Install the dotfiles
echo "Install the dotfiles (if the hostname exists in the config file)"
./dotdrop.sh install
