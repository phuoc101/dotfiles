#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Lock\n鈴 Suspend\n  Log out" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Lock") betterlockscreen -l dimblur ;;
	"鈴 Suspend") betterlockscreen --suspend dimblur ;;
	"  Log out") i3-msg exit ;;
	*) exit 1 ;;
esac
