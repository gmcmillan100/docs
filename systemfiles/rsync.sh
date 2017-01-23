#!/usr/local/bin/bash

#ARGS="--password-file=/usr/rsync-3.0.2/rsync-pass"

rsync --verbose --progress --stats --recursive --times --perms --delete /usr/home/greg/docs/ rsync@192.168.1.105:/DataVolume/rsync

