#!/bin/sh
#xrandr --output DisplayPort-0 --primary --mode 2560x1440 --pos 1680x0 --rotate normal
xrandr --output DP-2 --primary --mode 2560x1440 --pos 0x0 --rotate normal

#xrandr --output DVI-1 --mode 1680x1050 --pos 0x0 --rotate normal

#xrandr --newmode "1280x1024_75.00"  138.75  1280 1368 1504 1728  1024 1027 1034 1072 -hsync +vsync
#xrandr --newmode "1280x1024_60.00"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync
#xrandr --addmode DVI-0 1280x1024_75.00
#xrandr --output DVI-0 --mode 1280x1024_75.00 --pos 4240x0 --rotate normal
#xrandr --output DVI-0 --mode 1280x1024_75.00 --pos 2560x0 --rotate normal

xrandr --output DVI-D-0 --mode 1280x1024 --pos 2560x0 --rotate normal
