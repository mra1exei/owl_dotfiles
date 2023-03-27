#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar -c ~/.config/polybar/config.ini left &
polybar -c ~/.config/polybar/config.ini xwindow &
polybar -c ~/.config/polybar/config.ini center &
polybar -c ~/.config/polybar/config.ini tray &
polybar -c ~/.config/polybar/config.ini right &
polybar -c ~/.config/polybar/config.ini poweroff &
