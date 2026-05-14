#!/bin/bash

if ! xdotool search --name my_yequake_emacs_frame &>/dev/null; then
    emacsclient -n -e '(yequake-toggle "my_yequake_emacs_frame")'
    sleep 0.3
fi

i3-msg '[title="my_yequake_emacs_frame"] scratchpad show'
