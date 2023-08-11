#! /usr/bin/zsh

# Start kde connect
kdeconnect-indicator &;
notify-send "KDE Connect started" "Available: $(kdeconnect-cli -a --name-only)"
# Start ALSA service (for sound)
alsactl init;
notify-send "ALSA initiated"

XRANDR_OUT=$(xrandr)
MY_WALLPAPER_LARGE=~/dotfiles/wallpapers_dark/dark_gundam3.png
MY_WALLPAPER_SMALL=~/dotfiles/wallpapers_dark/dark_gundam6.jpg
MY_WALLPAPER_SMALL_RIGHT=~/dotfiles/wallpapers_dark/dark_gundam2.png

if [[ $XRANDR_OUT == *"HDMI-0 connected 1920x1080"* ]] || [[ $XRANDR_OUT == *"HDMI-0 connected primary 1920x1080"* ]]; then
  autorandr --load home_vn
  xrandr --output HDMI-0 --primary
  feh --bg-scale $MY_WALLPAPER_SMALL --bg-scale $MY_WALLPAPER_SMALL_RIGHT
  notify-send "Initialized display" "home_vn"
elif [[ $XRANDR_OUT == *"HDMI-0 disconnected"* ]]; then
  autorandr --load mobile
  xrandr --output eDP-1-1 --primary
  feh --bg-scale $MY_WALLPAPER_SMALL
  notify-send "Initialized display" "mobile"
fi
# Launching background apps
copyq &;
/usr/bin/syncthing serve --no-browser --logfile=default &;
# Update lockscreen
notify-send "Updating betterlockscreen" "$MY_WALLPAPER_LARGE"
betterlockscreen -u $MY_WALLPAPER_LARGE
notify-send "betterlockscreen updated" "$MY_WALLPAPER_LARGE"
