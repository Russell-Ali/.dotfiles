#!/bin/sh


if [ $(ps aux | grep "xidlehook" |  wc -l) -eq 2 ]
then
	echo "󰄱"
else
	echo "%{F#cb4b16}󰈈%{F- }"
fi

