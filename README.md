# My dotfiles

## Now using [freckles](https://github.com/makkus/freckles)!
Single-line install:
```bash
curl https://freckles.io | sudo bash -s -- freckelize -f gh:nathbo/dotfiles dotfiles ansible-tasks
```

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
- google-chrome (AUR)
- fish
  - oh-my-fish (github)
    - omf install agnoster
- arandr
- powerline-fonts-git (AUR)
- xcape (To use Super as Escape)
- sublime-text-dev (AUR)
- spotify (AUR)

