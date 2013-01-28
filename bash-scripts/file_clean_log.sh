#!/bin/bash
LOG_DIR=/var/log
ROOT_UID=0
LINES=50
E_XCD=66
E_NOTROOT=67

if [ "$UID" -ne "$ROOT_UID" ] 
then
    echo "Must be root to run this script."
    exit $E_NOTROOT
fi

if [ -n "$1" ] 
then
    lines=$1
else
    lines=$LINES
fi

#####################
#Use these is better
#E_WRONGARGS=65
#case "$1" in
#    ""  ) lines=50;;
#*[!0-9]*) echo "Usage: `basename $0` file-to-cleanup"; exit $E_WRONGARGS;;
#*       ) lines=$1;;
#esac
#####################

cd $LOG_DIR
if [ `pwd` != "$LOG_DIR" ] 
then
    echo "Can't change to $LOG_DIR."
    exit $E_XCD
fi
####################
#Use these is better
#cd /var/log || {
#    echo "Cannot change to necessary directory." >&2
#    exit $E_XCD
#}
####################

echo "lines=$lines"
tail -$lines messages > mesg.temp
mv mesg.temp messages

#cat /dev/null > messages
cat /dev/null > wtmp
echo "Logs cleaned up."

exit 0
