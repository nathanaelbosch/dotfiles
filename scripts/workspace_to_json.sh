#!/bin/bash

i3-save-tree --workspace $1 | tail -n +2 | fgrep -v '// splitv' | sed 's|//||g' > .i3/workspace.json
