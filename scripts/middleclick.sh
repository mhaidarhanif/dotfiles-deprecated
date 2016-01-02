#!/bin/bash
# set XKB layout
setxkbmap -layout us
# turn on mousekeys
xkbset m
# stop mousekeys expiring after a timeout
xkbset exp =m
# map keysym to other keysym
xmodmap -e "keysym Menu = Pointer_Button2"
# this also works
# xmodmap -e "keycode 135 = Pointer_Button2"
