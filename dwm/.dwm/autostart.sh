#!/bin/sh

# start status bar
pkill dwmblocks > /dev/null 2>&1; dwmblocks &
# restore wallpaper
$HOME/.fehbg &
# start compositor
picom > /dev/null 2>&1 &
# start polkit
pkill lxsession > /dev/null 2>&1; lxsession &
# set key repeat and delay
xset r rate 330 40 &
# disable the Xscreen saver
xset s off &
# lock screen after 5 mins and suspend 10 mins after that
locknsleep &
# notfication deamon
pkill dunst > /dev/null 2>&1; dunst &
# start clipboard manager
clipmenud > /dev/null 2>&1 &
# update the bar for audio level to show at cold start
pkill -RTMIN+1 dwmblocks &
