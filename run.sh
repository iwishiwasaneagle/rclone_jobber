#!/bin/bash
# This might belong in examples/ but this is the script I use in my crontab @reboot

rclone_jobber=/opt/rclone_jobber

source="$HOME/Documents"
dest="[DESTINATION]"
move_old_files_to="dated_directory"
options="--filter-from=$rclone_jobber/rclone_exclude.list -L -vvv"
monitoring_URL="[MONITORING URL]"

$rclone_jobber/rclone_jobber.sh "$source" "$dest" "$move_old_files_to" "$options" "$(basename $0)" "$monitoring_URL"
