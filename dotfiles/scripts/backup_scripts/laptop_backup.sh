#!/bin/bash
rsync -aAXvh \
    -e "ssh -i /home/nath/.ssh/id_rsa -F /home/nath/.ssh/config" \
    --progress -M--fake-super \
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
    --exclude="/home/*/.gvfs" \
    --exclude="/home/*/.thumbnails" \
    --exclude="/home/*/.cache/google-chrome" \
    --exclude="/home/*/.cache/spotify" \
    --exclude="/home/*/Dropbox" \
    --exclude="/home/*/.local/share/Trash" \
    --exclude="/home/*/Downloads" \
    --exclude="/home/*/sshfs_folders" \
    --exclude="/home/*/Storage" \
/ wg:~/backups/laptop
