#!/bin/sh

xrandr --newmode  "1280x1024_75.00"  138.75  1280 1368 1504 1728  1024 1027 1034 1072 -hsync +vsync
xrandr --addmode DVI-0 1280x1024_75.00
xrandr --output DisplayPort-0 --off --output DVI-1 --mode 1680x1050 --pos 0x0 --rotate normal --output DVI-0 --mode 1280x1024_75.00 --pos 1700x0 --rotate normal --output HDMI-0 --off


#exec_always xrandr --output CRT1 --mode 1280x1024 --pos 1400x0 --rotate normal --output DFP6 --off --output DFP7 --primary --mode 1400x1050 --pos 0x0 --rotate normal --output DFP4 --off --output DFP5 --off --output DFP2 --off --output DFP3 --off --output DFP1 --off
