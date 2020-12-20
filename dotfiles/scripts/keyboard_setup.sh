#!/bin/bash
setxkbmap eu
setxkbmap -option caps:super
setxkbmap -option compose:menu
if command -v xcape &> /dev/null
then
    xcape -e 'Super_L=Escape'
fi
