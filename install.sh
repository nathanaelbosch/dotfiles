#!/bin/sh

# Clone the dotfile repo
git clone --recursive https://github.com/nathbo/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install the dotdrop requirements
python -m venv .venv
. .venv/bin/activate
pip install --user -r dotdrop/requirements.txt

# Install the dotfiles
./dotdrop.sh install
