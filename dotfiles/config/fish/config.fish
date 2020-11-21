abbr -a -- - 'cd -'
abbr -a -- paper 'zt ~/MEGA/papers/lib/'

set pipenv_fish_fancy yes

# Load aliases
if test -e ~/.aliases
    source ~/.aliases
end

# Start X at login
if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
end

thefuck --alias | source

if command -v pyenv > /dev/null
    status --is-interactive; and source (pyenv init -|psub)
end
