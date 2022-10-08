# There's no place like $HOME
I use [dotdrop](https://github.com/deadc0de6/dotdrop) to manage my dotfiles.

## Installation
```bash
sh -c "$(curl https://raw.githubusercontent.com/nathanaelbosch/dotfiles/master/install.sh)"
```
Check out the [install script](install.sh) for more details.

If the hostname does not match any of the profiles, you can also specify a profile that differs from the hostname to install it, such as
```bash
./dotdrop.sh install -p terminal
```
If you want to customize your installation, the best way is to edit the `config.yaml` file directly.

### More useful commands:
```bash
./dotdrop.sh compare
./dotdrop.sh import
./dotdrop.sh update
```
Check the [dotdrop github](https://github.com/deadc0de6/dotdrop) for more detailed explanations.


## List of relevant applications
This is a solid start on ubuntu-based systems:
```bash
sudo apt install fish git alacritty bat coreutils lsd gpg htop moreutils vim xcape xclip fonts-firacode fonts-font-awesome fonts-hack-ttf arandr keepassxc ledger mu4e nitrogen nodejs offlineimap pandoc redshift-gtk sxhkd syncthing
```

The longer list of applications:
- **Terminal and System**:
    - fish (with [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish) and the agnoster theme)
    - emacs ([spacemacs](https://www.spacemacs.org))
    - alacritty
    - git
    - vim
    - xcape (to use CapsLock as Escape key via `xcape -e 'Super_L=Escape'`)
    - tmux
    - htop
    - other tools: `xclip`, [bat](https://github.com/sharkdp/bat), [lsd](https://github.com/Peltoche/lsd)
- **Desktop Environment**:
    - i3 / [i3-gaps](https://github.com/Airblader/i3) / [i3-gnome](https://github.com/i3-gnome/i3-gnome)
    - `sxhkd` to manage all hotkeys
    - arandr & [mons](https://github.com/Ventto/mons) to manage screens
    - nitrogen
    - redshift (`redshift-gtk`) for the night
- **Fonts**:
    - FiraCode (`fonts-firacode`)
    - Hack (`fonts-hack-ttf`)
    - Font Awesome (`fonts-font-awesome**)
- **Other Software**:
    - **Browser**: firefox
    - **Cloud Storage**: (syncthing)[https://syncthing.net/] & (megasync)[https://mega.io/desktop**
    - **PDF reader**: zathura
    - **Passwords**: keepassxc
    - **Email Setup**: offlineimap+msmtp+(spac**emacs
    - **Office**: LaTeX of course (`texlive-most` & `latexmk**)
    - **Videos**: vlc
    - **Music**: spotify
