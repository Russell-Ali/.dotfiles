#!/bin/sh

if [ $(ps aux | grep "xidlehook" | wc -l) -eq 1 ]
then
	notify-send "normal mode" -u low -t 2000
	 /home/rasul/sources/scripts/locknsleep.sh &
else
	notify-send "presentation mode" -u low -t 2000
	killall -q xidlehook
fi
