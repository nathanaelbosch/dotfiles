#!/bin/bash

#someone on /r/linuxmasterrace asked what image programs were good for shitposts
#it got me thinking that there should be a cli command just for that
#days later (I'm still pretty noob)...

#SHITPOST
#Takes an image and adds some shitty text to it

#	DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
#		Version 2, December 2004 
#Copyright (C) 2004 Sam Hocevar <sam@hocevar.net> 
#Everyone is permitted to copy and distribute verbatim or modified 
#copies of this license document, and changing it is allowed as long 
#as the name is changed. 
#	DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
#TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND  MODIFICATION 
# 0. You just DO WHAT THE FUCK YOU WANT TO.

#Originally by Mykal Anderson



#Begin

#Check if imagemagick (just convert checked, but others used) is installed and exit if missing

command -v convert >/dev/null 2>&1 || { echo >&2 "I require ImageMagick but it's not installed.  Aborting."; exit 1; }

#Get CLI args

OPTIND=1

top_text=" "
bottom_text=" "
image_file=""

while getopts "h?t:b:f:" opt; do

    case "$opt" in
    h|\?)
	    printf "Available options are:\n t - Top Text\n b - Bottom Text\n f - Path to image file - Mandatory!\n"
	    exit 0
	    ;;
    t)	top_text="$OPTARG"
	    ;;
    b)	bottom_text="$OPTARG"
	    ;;
    f)	image_file="$OPTARG"
	    ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift

#Make sure an image file was set and that it exists, or, what are we doing here, really. (Does not successfully check when source is a URL that fails to load, https for example) Would like to confirm it's an image file convert will take too but...
if [ -z "$image_file" ]
    then echo "You must specify an image file. Use -h or -? for help."; exit 1
fi

#Let the user know any options that were invalid that were not allready    handled by getopts.
if [ ! -z "$@" ]
    then printf "Invalid arguement(s): \"$@\"\nIgnored, continuing...\n"
fi

#Get some info on the file path etc
path=${image_file%/*} 
base=${image_file##*/}
fext=${base##*.}
pref=${base%.*}

#Upscale the image if it's too shitty. This is required to make the text     readable as it's generated to fit the pixels of the original
convert -resize 1024x1024\< "$image_file" shitpost-temp-resize.gif

#Get the height and width of the image to use later to size the overlays. Clipped height keeps things locked in the top and bottom fifth of the image.
image_width=`identify -format "%[width]" shitpost-temp-resize.gif`
image_height=`identify -format "%[height]" shitpost-temp-resize.gif`
clipped_height=$(($image_height/5))
stroke_width=$(($clipped_height/40))

#Improved with edits from /u/baudouin_roullier
convert -background none -fill white -stroke black -strokewidth "$stroke_width" -size "$image_width"x"$clipped_height" -gravity Center -font 'Impact' caption:"$top_text" temp-top-text.gif
convert -background none -fill white -stroke black -strokewidth "$stroke_width" -size "$image_width"x"$clipped_height" -gravity Center -font 'Impact' caption:"$bottom_text" temp-bottom-text.gif
composite -gravity north temp-top-text.gif shitpost-temp-resize.gif shitpost-temp-composite.gif
composite -gravity south temp-bottom-text.gif shitpost-temp-composite.gif shitpost-"$pref"."$fext"

#Clean up
rm temp-top-text.gif
rm temp-bottom-text.gif
rm shitpost-temp-resize.gif
rm shitpost-temp-composite.gif

#Announce the results
echo "Created file "$PWD"/shitpost-"$pref"."$fext""

exit 0

#End
