#!/usr/bin/sh

VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '/Mute/ { print $2 }')
if [ $MUTE = "no" ]; then
    echo " 󰕾 $VOLUME% "
else
    echo "   MUTED "
fi
