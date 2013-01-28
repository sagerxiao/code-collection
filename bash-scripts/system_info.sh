#!/bin/bash
#system_info.sh
clear
echo "This is information provided by system_info.sh. Program start now"

echo "Hello, $USER"
echo

echo "Today's date is `date`, this a week `date +"%V"`."
echo

echo "These users are currently connected:"
#set -x
w | cut -d " " -f 1 - | grep -v USER | sort -u
#set +x
echo

echo "This is `uname -s` running on a `uname -m` processor."
echo

echo "This is the uptime information:"
uptime
echo

echo "That's all folks!"
