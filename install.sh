#!/bin/sh

echo "
################################################################################
# Pre-Setup: Consider stopping the script installing some packages
# (e.g. fish, git, python, bat, vidir, alacritty, tmux, ...)
################################################################################
"
echo -n "Press ENTER to continue"
read _


echo "
################################################################################
# Clone the dotfiles repo into ~/dotfiles
################################################################################
"
git clone --recursive https://github.com/nathanaelbosch/dotfiles.git ~/dotfiles
cd ~/dotfiles

echo "
################################################################################
# Install the dotdrop requirements into a new venv
################################################################################
"
python3 -m venv .venv
. .venv/bin/activate
pip install -r dotdrop/requirements.txt

# Install the dotfiles
echo "
################################################################################
# Install the dotfiles (if the hostname exists in the config file)
################################################################################
"
echo -e "Please enter the profile to be used (leave empty to use hostname): "
read profile
if [ -z "$profile" ]; then
    ./dotdrop.sh install
else
    ./dotdrop.sh install -p $profile
fi

