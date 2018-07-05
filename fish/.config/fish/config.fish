abbr -a -- - 'cd -'
if test -e ~/.aliases
    source ~/.aliases
end

# goto makro to quickly open any Project + venv
function project -d "Go to project and activate venv"
    set PROJECT_NAME $argv
    # echo "Going to $PROJECT_NAME"
    cd ~/Projekte/$PROJECT_NAME
    if test $status = 0; and test -d .venv
        echo "Activating venv"
        . .venv/bin/activate.fish
    end
end

function new_project
    set PROJECT_NAME $argv
    set PROJECT_PATH "/home/nath/Projekte/$PROJECT_NAME"
    echo "Path: $PROJECT_PATH"
    if not test -d $PROJECT_PATH
        echo "Initializing Project"
        mkdir $PROJECT_PATH
        cd $PROJECT_PATH
        python -m venv .venv
        . .venv/bin/activate.fish
        # touch requirements.txt
        # # touch test_sample.py
        # # mkdir $PROJECT_NAME
        # # touch README.md
    else
        echo "Project exists already!"
        return 1
    end
end

