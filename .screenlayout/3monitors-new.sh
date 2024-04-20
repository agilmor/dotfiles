#!/bin/sh
xrandr --output HDMI-0   --mode 1920x1080 --pos 1920x1080 --rotate normal --auto --primary \
       --output HDMI-1-2 --mode 1920x1080 --pos 0x1080    --rotate normal --auto \
       --output VGA-0    --mode 1920x1080 --pos 0x0       --rotate normal --auto \
       --output HDMI-1-3 --off \
       --output DVI-D-0  --off \
       --output DP-1-1   --off
