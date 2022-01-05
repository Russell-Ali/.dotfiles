#!/bin/sh

if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  bluetoothctl power on; notify-send -u low -t 2000 "Bluetooth enabled"
else
  bluetoothctl power off; notify-send -u low -t 2000 "Bluetooth disabled"
fi
