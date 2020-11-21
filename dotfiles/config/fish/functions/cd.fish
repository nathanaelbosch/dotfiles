function cd
    if test -d ./venv
        deactivate
    else if test -d ./.venv
        deactivate
    end

    set old_dirprev $dirprev
    set dirprev (pwd)

    if test "$argv" = "-"
        builtin cd $old_dirprev
    else
        builtin cd $argv
    end

    if test -d ./venv
        . venv/bin/activate.fish
    else if test -d ./.venv
        . .venv/bin/activate.fish
    end
end
