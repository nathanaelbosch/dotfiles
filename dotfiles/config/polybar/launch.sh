#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


# Make the launched bar dependent on the host name!
if [ "$HOSTNAME" = nath-pc ]; then
    i=0
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        case $i in
            0)
                polybar bottom_main &;;
            1)
                polybar bottom_left &;;
            2)
                polybar bottom_right &;;
            *)
                # polybar top &
        esac
        i=$((i + 1))
        echo $i
    done
    # polybar top &
elif [ "$HOSTNAME" = nath-laptop ]; then
    polybar bottom_laptop &
fi


echo "Bars launched..."
