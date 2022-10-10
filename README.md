# There's no place like $HOME
I use [dotdrop](https://github.com/deadc0de6/dotdrop) to manage my dotfiles.

## Installation
One-line install:
```bash
sh -c "$(curl https://raw.githubusercontent.com/nathanaelbosch/dotfiles/master/install.sh)"
```
It will query which profile should be installed.
For a minimal setup just use `terminal`; if nothing is specified it defaults to the hostname.
For more details check out the [install script](install.sh).

### More manual setup
To install the config for the current host, run
```bash
cd ~/dotfiles
./dotdrop.sh install
```
Alternatvely, specify a profile manually:
```bash
./dotdrop.sh install -p terminal
```
For more customization, edit the `config.yaml` file directly.

Other useful commands:
```bash
./dotdrop.sh compare
./dotdrop.sh import
./dotdrop.sh update
```
Check the [dotdrop documentation](https://dotdrop.readthedocs.io/en/latest/) for more.


## Software
This is a solid start on ubuntu-based systems:
```bash
sudo apt install fish git alacritty bat coreutils lsd gpg htop moreutils vim xcape xclip fonts-firacode fonts-font-awesome fonts-hack-ttf arandr keepassxc ledger mu4e nitrogen nodejs offlineimap msmtp-mta pandoc redshift-gtk sxhkd syncthing snapd
sudo snap install emacs --classic
sudo snap install ferdium --edge
```

### The longer list of applications:
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
- **Theme:** [gruvbox](https://github.com/morhetz/gruvbox) everywhere
- **Fonts**:
    - FiraCode (`fonts-firacode`)
    - Hack (`fonts-hack-ttf`)
    - Font Awesome (`fonts-font-awesome`)
- **Other Software**:
    - **Browser**: firefox
    - **Cloud Storage**: [syncthing](https://syncthing.net/) & [megasync](https://mega.io/desktop)
    - **PDF reader**: zathura
    - **Passwords**: keepassxc
    - **Email Setup**: offlineimap+msmtp+(spac)emacs
    - **Writing**: LaTeX of course (`texlive-most` & `latexmk`)
    - **Social Media / Messengers / Slack / ...**: [Ferdium](https://ferdium.org/)
    - **Videos**: vlc
    - **Music**: spotify

## Misc stuff
- To send email with mu4e+msmtp on ubuntu, disable app armor: `sudo aa-disable /etc/apparmor.d/usr.bin.msmtp`
