if test -e ~/.config/fish/conf.d/omf.fish
    source ~/.config/fish/conf.d/omf.fish
end

abbr -a -- - 'cd -'
if test -e ~/.aliases
    source ~/.aliases
end
