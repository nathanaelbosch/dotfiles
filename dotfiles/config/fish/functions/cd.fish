function cd
    if test -d ./venv
        deactivate
    else if test -d ./.venv
        deactivate
    end

    builtin cd $argv

    if test -d ./venv
        . .venv/bin/activate.fish
    else if test -d ./.venv
        . .venv/bin/activate.fish
    end
end
