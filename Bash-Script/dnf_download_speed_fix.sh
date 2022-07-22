#!/usr/bin/bash

# DNF Download speed fix for Fedora

# check if root
if [[ $EUID -ne 0 ]]; then
   echo "You are not root!"
   exit 1
fi

# check if dnf config file exists and if so write the fix to config file
CONF_FILE=/etc/dnf/dnf.conf
if [ -f "$CONF_FILE" ]; then
    echo -e "max_parallel_downloads=10\nfastestmirror=True" >> /etc/dnf/dnf.conf
    echo "DNF Download speed fixed!"
else
    echo "$CONF_FILE not found."
fi


