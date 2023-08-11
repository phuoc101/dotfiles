#! /usr/bin/zsh

# Start kde connect
kdeconnect-indicator &;
notify-send "KDE Connect started" "Available: $(kdeconnect-cli -a --name-only)"
# Start ALSA service (for sound)
alsactl init;
notify-send "ALSA initiated"

set_walls

# Launching background apps
copyq &;
/usr/bin/syncthing serve --no-browser --logfile=default &;
# Update lockscreen
notify-send "Updating betterlockscreen" "$MY_WALLPAPER_LARGE"
betterlockscreen -u $MY_WALLPAPER_LARGE
notify-send "betterlockscreen updated" "$MY_WALLPAPER_LARGE"
