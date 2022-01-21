#!/bin/sh

if [ $(ps aux | grep "xidlehook" | wc -l) -eq 1 ]
then
	notify-send "Caffeine disabled" -u low -t 2000
	 /home/rasul/sources/scripts/locknsleep.sh &
else
	notify-send "Caffeine enabled" -u low -t 2000
	killall -q xidlehook
fi
