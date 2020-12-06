#!/bin/sh
xrandr --output DVI-D-0 --off --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off
# to make sure the HDMI shows up as an audio output N.B. no audio can be playing at this point
pulseaudio -k
pacmd set-sink-port alsa_output.pci-0000_00_1f.3.analog-stereo hdmi-output-1
