# My dotfiles

## Now using [freckles](https://github.com/makkus/freckles)!
Single-line install on a fresh [Manjaro i3 community edition](https://manjaro.org/community-editions/):
```bash
curl https://freckles.io | bash -s -- freckelize -f gh:nathbo/dotfiles dotfiles ansible-tasks
```
Or clone with ssh when I'm on a machine with a confirmed key:
```bash
curl https://freckles.io | bash -s -- freckelize -f git@github.com:nathbo/dotfiles.git dotfiles ansible-tasks
```

## For a more modular approach:
Clone directory, `cd` into, and stow the necessary files, eg. just the console stuff, fish, and vim:
```bash
git clone https://github.com/nathbo/dotfiles.git
cd dotfiles
stow -t "$HOME" console_environment fish vim
```

## TODO
Use [qualia](https://github.com/darkfeline/mir.qualia)
Do I really need freckles? Think about how to write my own script to handle that functionality.


## Notes on some programs:
- Terminal: Tomorrow night colors
- Fish:
  - Aliases are not in functions! Config file now sources .aliases
- Bash:
  - Aliases in .aliases
  - Loads .profile now
- Yaourt: No prompts
- Vim: Just a simple vimrc so far
- .Xresources & .extend.Xresources: Terminal colors
- i3:
  - Imports the colors defined for X
  - Multiscreen layout at startup, script in .screenlayout/standard_layout.sh
  - CapsLock as Super and Escape, script in bin/keyboard_setup.sh
  - Sublime+Terminal workspace hotkey using Mod+Ctrl+c
- Themes+Icons: Created with oomox
- Other files:
  - .aliases: Used throughout fish, bash, and zsh

## Programs to install
Not all of those are necessary, but this also represents a list of programs that I use personally and which I'd want to install early when setting up a new PC.

- redshift
- dropbox (AUR)
- firefox
- fish
  - oh-my-fish (github)
    - omf install agnoster
- arandr
- powerline-fonts-git (AUR)
- ttf-font-awesome (AUR)
- ttf-material-icons (AUR)
- xcape (To use Super as Escape)
- sublime-text-dev (AUR)
- spotify (AUR)
- pia VPN (as on website)
- megasync (from website)
- libreoffice
- xclip
