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
if ! command -v uv >/dev/null 2>&1; then
    echo "
################################################################################
# uv not found - uv is recommended for faster package installation
# Install from: https://docs.astral.sh/uv/getting-started/installation/
# After installing, restart your shell or run: source ~/.cargo/env
# Or continue with standard venv and pip
################################################################################
"
    echo -n "Press ENTER to continue"
    read _
fi
if command -v uv >/dev/null 2>&1; then
    echo "Using uv for venv creation and package installation"
    uv venv .venv
    . .venv/bin/activate
    uv pip install -r dotdrop/requirements.txt
else
    echo "Falling back to standard venv and pip"
    python3 -m venv .venv
    . .venv/bin/activate
    pip install -r dotdrop/requirements.txt
fi
# Install the dotfiles
echo "
################################################################################
# Install the dotfiles
################################################################################
"
echo "Available profiles:"
./dotdrop.sh profiles
echo ""
echo "Please enter the profile to be used (leave empty to use hostname): "
read profile
if [ -z "$profile" ]; then
    ./dotdrop.sh install
else
    ./dotdrop.sh install -p $profile
fi
