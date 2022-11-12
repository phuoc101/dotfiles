#! /usr/bin/zsh

XRANDR_OUT=$(xrandr)
MY_WALLPAPER_LARGE=~/Pictures/wallpapers/thevalley_large.png
MY_WALLPAPER_SMALL=~/Pictures/wallpapers/thevalley_small.png
MY_WALLPAPER_SMALL_RIGHT=~/Pictures/wallpapers/thevalley_small_right.png

if [[ $XRANDR_OUT == *"HDMI-0 connected 1920x1200+0+0"* ]] || [[ $XRANDR_OUT == *"HDMI-0 connected primary 1920x1200+0+0"* ]]; then
  autorandr --load home_tampere
  xrandr --output HDMI-0 --primary
  feh --bg-scale $MY_WALLPAPER_SMALL --bg-scale $MY_WALLPAPER_SMALL_RIGHT
  notify-send "Initialized display" "home_tampere"
elif [[ $XRANDR_OUT == *"HDMI-0 connected 2560x1440"* ]] || [[ $XRANDR_OUT == *"HDMI-0 connected primary 2560x1440"* ]]; then
  autorandr --load work
  xrandr --output HDMI-0 --primary
  feh --bg-scale $MY_WALLPAPER_SMALL --bg-scale $MY_WALLPAPER_SMALL_RIGHT
  notify-send "Initialized display" "work"
elif [[ $XRANDR_OUT == *"HDMI-0 connected 3440x1440"* ]] || [[ $XRANDR_OUT == *"HDMI-0 connected primary 3440x1440"* ]]; then
  autorandr --load work2K
  xrandr --output HDMI-0 --primary
  feh --bg-scale $MY_WALLPAPER_LARGE --bg-scale $MY_WALLPAPER_SMALL_RIGHT
  notify-send "Initialized display" "work2K"
elif [[ $XRANDR_OUT == *"HDMI-0 disconnected"* ]]; then
  autorandr --load mobile
  xrandr --output eDP-1-1 --primary
  feh --bg-scale $MY_WALLPAPER_SMALL
  notify-send "Initialized display" "mobile"
fi
notify-send "Updating betterlockscreen" "$MY_WALLPAPER_LARGE"
betterlockscreen -u $MY_WALLPAPER_LARGE
notify-send "betterlockscreen updated" "$MY_WALLPAPER_LARGE"
