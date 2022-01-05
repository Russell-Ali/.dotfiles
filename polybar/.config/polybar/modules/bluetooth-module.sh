#!/bin/sh

if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "[󰂲]"
else
  if [ $(bluetoothctl info | grep 'Name' | wc -c) -eq 0 ]
  then 
    echo "%{F#cb4b16}[󰂯]%{F- }"
  else
	status=$(bluetoothctl info | grep 'Name' | awk '{$1 = "[󰂱"; print $0"]"}')
	echo "$status"
  fi
fi
