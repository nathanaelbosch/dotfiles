abbr -a -- - 'cd -'
abbr -a -- paper 'zt ~/MEGA/papers/lib/'

# Load aliases
if test -e ~/.aliases
    source ~/.aliases
end

# Virtualfish
eval (python3.6 -m virtualfish)

# goto makro to quickly open any Project + venv
function project -d "Go to project and activate venv"
    set PROJECT_NAME $argv
    # echo "Going to $PROJECT_NAME"
    cd ~/Projekte/$PROJECT_NAME
    if test $status = 0; and test -d .venv
        # echo "Activating venv"
        . .venv/bin/activate.fish
    end
end

function uni -d "Go to uni folder"
    set COURSE_NAME $argv
    # echo "Going to $PROJECT_NAME"
    cd ~/MEGA/Uni/$COURSE_NAME
end


# Start X at login
if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
end
