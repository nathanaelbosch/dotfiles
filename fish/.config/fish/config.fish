abbr -a -- - 'cd -'
if test -e ~/.aliases
    source ~/.aliases
end

# goto makro to quickly open any Project + venv
function gt
    set PROJECT_NAME $argv
    echo "Going to $PROJECT_NAME"
    cd ~/Projekte/$PROJECT_NAME
    echo "Activating venv"
    . .venv/bin/activate.fish
end
