#!/bin/sh
xrandr --output DFP1 --primary --mode 2560x1440 --pos 1680x0 --rotate normal

xrandr --output DFP7 --mode 1680x1050 --pos 0x0 --rotate normal

#xrandr --newmode  "1280x1024_75.00"  138.75  1280 1368 1504 1728  1024 1027 1034 1072 -hsync +vsync
#xrandr --addmode CRT1 1280x1024_75.00
xrandr --output CRT1 --mode 1280x1024 --pos 4240x0 --rotate normal