#! /bin/sh

ROFI_DIR=~/.config/rofi/scripts
chosen=$(printf "  Wifi Settings\n  Bluetooth Settings\n  Language Select\n勒  Reload services\n  Display Settings\n  Power Menu" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	# Need network-manager (to use nmcli)
	"  Wifi Settings") $ROFI_DIR/rofi-wifi-menu.sh ;;
	"  Bluetooth Settings") rofi-bluetooth ;;
	# Need ibus
	"  Language Select") $ROFI_DIR/rofi-lang.sh ;;
	"勒  Reload services") killall picom dunst xborders; sleep 0.1; picom; dunst;  ~/sys_tools/xborder/xborders -c ~/.config/xborder/config.json ;;
	"  Display Settings") $ROFI_DIR/rofi-displays.sh ;;
	"  Power Menu") $ROFI_DIR/powermenu.sh ;;
	*) exit 1 ;;
esac
