#!/usr/bin/bash
# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
if xrandr | grep -q 'HDMI-0 connected'; then
  polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
  polybar sub 2>&1 | tee -a /tmp/polybar2.log & disown
else
  polybar mobile 2>&1 | tee -a /tmp/polybar1.log & disown
fi

echo "Bars launched..."