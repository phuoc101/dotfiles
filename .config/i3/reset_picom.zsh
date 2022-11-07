#!/usr/bin/zsh
killall picom dunst xborders; sleep 0.1;  ~/sys_tools/xborder/xborders -c ~/.config/xborder/config.json; dunst; picom
