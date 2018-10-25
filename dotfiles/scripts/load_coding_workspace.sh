#!/bin/bash

# Workspace selection is handled in .i3/config
i3-msg "workspace --no-auto-back-and-forth number 3:; append_layout ~/.i3/coding.json"

# re-populate layout with programs
subl3
terminal -cd /home/nath/Projekte/bitpython2.0 -title "bitpython2.0"
