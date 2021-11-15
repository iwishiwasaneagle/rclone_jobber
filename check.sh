#!/bin/bash
# Validate the backups via rclone check

URL="[HEALTHCHECK]"
source="$HOME/Documents"
dest="[DESTINATION]"
move_old_files_to="dated_directory"
options="--filter-from=$rclone_jobber/rclone_exclude.list --size-only --syslog"
monitoring_URL="[MONITORING URL]"

# I use healthchecks.io which enables run time checking too. Useful in case rclone check crashes the script
# A way around this could be using `trap`
curl "$URL/start"

rclone check $source $dest/last_snapshot $options
exit_code=$?

curl "$URL/$exit_code"
