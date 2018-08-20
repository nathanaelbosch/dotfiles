# My dotfiles
I use [dotdrop](https://github.com/deadc0de6/dotdrop) to manage my dotfiles.

## Usage
### Dotdrop Installation
Dotdrop requires python as well as some packages to work, so make sure to have a working **python** and **pip** installed.
```bash
git clone --recursive https://github.com/nathbo/dotfiles.git ~/dotfiles
cd ~/dotfiles
pip install --user -r dotfiles/requirements.txt
```
After this the `./dotdrop.sh` should be functional. Test it with `./dotdrop.sh help`.

### Installing dotfiles
If the hostname matches one of the profiles, just use
```bash
./dotdrop.sh install
```
You can also specify a profile that differs from the hostname to install it. If you want to customize your installation, the best way is to edit the `config.yaml` file directly.

### More useful commands:
```bash
./dotdrop.sh compare
./dotdrop.sh import
./dotdrop.sh update
```
Check the [dotdrop github](https://github.com/deadc0de6/dotdrop) for more detailed explanations.


## My Setup

![laptop neofetch](screenshots/neofetch.png?raw=true "Laptop Neofetch")

Both my computers currently use the same setup
- **OS**: [Manjaro](https://manjaro.org/community-editions/) (i3 community edition)
- **WM**: [i3-gaps](https://github.com/Airblader/i3) with [polybar](https://github.com/jaagr/polybar)
- **Terminal**: [urxvt](https://wiki.archlinux.org/index.php/Rxvt-unicode)
- **Shell**: [fish](https://fishshell.com/) with [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)

## Applications
- Terminal and System:
    - git
    - arandr
    - compton
    - xcape
    - xclip
    - tmux
- Text Editors:
    - sublime-text-dev (AUR)
    - vim
- Browser:
    - qutebrowser
    - chromium
- Documents:
    - libreoffice
- Media:
    - vlc
    - spotify (AUR)
- Cloud Storage:
    - dropbox (AUR)
    - megasync (from website)
- Fonts:
    - powerline-fonts-git (AUR)
    - ttf-font-awesome (AUR)
    - ttf-material-icons (AUR)
- Other stuff:
    - redshift
    - pia VPN (as on website)
