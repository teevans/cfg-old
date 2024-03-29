#!/usr/bin/env sh

# Terminate all running polybar instances
killall -q polybar

# Wait untilprocesses have been shut donw
while pgrep -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload example &
fi
