#!/bin/sh

# start status bar
dwmblocks &
# restore wallpaper
$HOME/.fehbg &
# start compositor
picom &
# start polkit
lxsession &
# set the cursor
xsetroot -cursor_name left_ptr & 
# set key repeat and delay
xset r rate 330 40 &
# lock screen after 5 mins and suspend 10 mins after that
$HOME/sources/scripts/locknsleep.sh &
# notfication deamon
killall -q  dunst;  dunst &
# start clipboard manager
clipmenud &
# update the bar for audio level to show at cold start
sleep 1; pkill -RTMIN+1 dwmblocks &
