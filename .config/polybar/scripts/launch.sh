#!/usr/bin/bash
sleep 2
# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
if xrandr | grep -q 'HDMI-1-0 connected'; then
    polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
    polybar sub_2k 2>&1 | tee -a /tmp/polybar2.log & disown
    notify-send "Polybar" "Launched main and sub bars"
elif xrandr | grep -q 'DP-1-4 connected'; then
    polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
    polybar sub_2k 2>&1 | tee -a /tmp/polybar2.log & disown
    notify-send "Polybar" "Launched main and sub bars"
elif xrandr | grep -q 'DisplayPort-2 connected'; then
    polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
    polybar sub_2k 2>&1 | tee -a /tmp/polybar2.log & disown
    notify-send "Polybar" "Launched main and sub bars"
else
    polybar main_2k 2>&1 | tee -a /tmp/polybar1.log & disown
    notify-send "Polybar" "Launched main bar"
fi
