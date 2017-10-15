#!/bin/bash
rsync -aAXv --progress -M--fake-super \
    --exclude="/dev/*" \
    --exclude="/proc/*" \
    --exclude="/sys/*" \
    --exclude="/tmp/*" \
    --exclude="/run/*" \
    --exclude="/mnt/*" \
    --exclude="/media/*" \
    --exclude="/lost+found" \
    --exclude="/swapfile" \
    --exclude="/etc/fstab" \
    --exclude="/var/run/*" \
    --exclude="/var/lock/*" \
    --exclude="/lib/modules/*/volatile/.mounted" \
    --exclude="/var/cache/apt/archives/*" \
    --exclude="/home/*/.gvfs" \
    --exclude="/home/*/.thumbnails" \
    --exclude="/home/*/.cache/google-chrome" \
    --exclude="/home/*/.cache/spotify" \
    --exclude="/home/*/Dropbox" \
    --exclude="/home/*/.local/share/Trash" \
    --exclude="/home/*/Downloads" \
/ wg:~/backups/pc2


#    --exclude="/home/*/Documents/Uni" \
#    --exclude="/home/*/storage" \
#    --exclude="/home/*/Projekte/bitpython2.0/data" \
