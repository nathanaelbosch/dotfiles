#!/bin/bash
# ~/.local/bin/toggle-notepad.sh

if ! xdotool search --class floating_notes &>/dev/null; then
    alacritty --class floating_notes -e vim ~/notes.org &
    sleep 0.3
fi

i3-msg '[instance="floating_notes"] scratchpad show'
