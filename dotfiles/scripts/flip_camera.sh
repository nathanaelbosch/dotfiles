#!/usr/bin/bash

# ffmpeg -f v4l2 -i /dev/video0 \
#        -vf "hflip,format=yuv420p" \
#        -f v4l2 /dev/video2

ffmpeg -f v4l2 -i /dev/video0 \
       -vf "hflip,vflip,format=yuv420p" -metadata:s:v rotate=0 \
       -f v4l2 /dev/video2
