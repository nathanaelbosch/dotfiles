#!/bin/sh
xrandr --output DVI-D-0 --off \
       --output HDMI-0 --mode 3840x2160 --pos 0x1061 --rotate normal --primary \
       --output DP-0 --off \
       --output DP-1 --off \
       --output DP-2 --off \
       --output DP-3 --off \
       --output DP-4 --mode 4096x2160 --pos 3840x0 --rotate right \
       --output DP-5 --off
