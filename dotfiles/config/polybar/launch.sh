#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


# Make the launched bar dependent on the host name!
if [ "$HOSTNAME" = nath-pc ]; then
    polybar bottom_main &
    polybar bottom_left &
    polybar bottom_right &
    # polybar top &
elif [ "$HOSTNAME" = nath-laptop ]; then
    polybar bottom_laptop &
fi


echo "Bars launched..."
