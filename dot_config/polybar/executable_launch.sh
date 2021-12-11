#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Set colors according to those defined by wal
source "${HOME}/.cache/wal/colors.sh"
background=$color0
foreground=$color7
tertiary=$color2
fourth=$color4

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi
