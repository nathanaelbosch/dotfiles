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
- **Terminal and System**:
    - fish (with [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish) and the agnoster theme)
    - git
    - arandr
    - xcape
    - xclip
    - tmux
    - i3-gaps
    - alacritty
- Text Editors:
    - emacs ([spacemacs](https://www.spacemacs.org))
    - vim
- Browser:
    - firefox
- Documents:
    - libreoffice
    - zathura
    - LaTeX (texlive-most; biber)
- Media:
    - vlc
    - spotify (AUR)
- Cloud Storage:
    - syncthing
    - megasync (from website)
- Fonts:
    - powerline-fonts-git (AUR)
    - ttf-font-awesome (AUR)
    - ttf-material-icons (AUR)
- Other stuff:
    - redshift
    - pia VPN (as on website)
