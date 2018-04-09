#!/bin/bash

BACKUP=/etc/.crontab
CRONTAB=/etc/crontab

if [ ! -e $BACKUP ]; then
	echo "0 0 * * * root /home/junho/yeee/04.sh 2>&1" | crontab
	sudo cp $CRONTAB $BACKUP
fi

if [ -e $BACKUP ]; then
	if [[ $(awk -F: '{ print $1 }' $CRONTAB) == $(awk -F: '{ print $1 }' $BACKUP) ]]; then
		exit
	fi
	if [[ $(awk -F: '{ print $1 }' $CRONTAB) != $(awk -F: '{ print $1 }' $BACKUP) ]]; then
		mail -s "crontab has been modified" junho <<< 'crontab has been modified'
		sudo cp $CRONTAB $BACKUP
	fi
fi
