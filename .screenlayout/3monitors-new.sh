#!/bin/sh
xrandr --output HDMI-0   --mode 1920x1080 --pos 1920x1080 --rotate normal --primary \
       --output HDMI-1-1 --mode 1920x1080 --pos 0x1080    --rotate normal \
       --output VGA-0    --mode 1920x1080 --pos 0x0       --rotate normal \
       --output HDMI-1-2 --off \
       --output DVI-D-0  --off \
       --output DP-1-1   --off
