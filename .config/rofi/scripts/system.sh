#! /bin/sh

ROFI_DIR=~/.config/rofi/scripts
chosen=$(printf "  Wifi Settings\n  Language Select\n勒  Reload picom\n  Display Settings\n  Power Menu" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	# Need network-manager (to use nmcli)
	"  Wifi Settings") $ROFI_DIR/rofi-wifi-menu.sh ;;
	# Need ibus
	"  Language Select") $ROFI_DIR/rofi-lang.sh ;;
	"勒  Reload picom") killall picom; sleep 0.1; picom ;;
	"  Display Settings") $ROFI_DIR/rofi-displays.sh ;;
	"  Power Menu") $ROFI_DIR/powermenu.sh ;;
	*) exit 1 ;;
esac
