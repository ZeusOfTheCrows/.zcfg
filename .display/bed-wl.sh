#!/bin/bash

kscreen-doctor config \
output.HDMI-A-1.enable \
output.HDMI-A-1.mode.1920x1080@60 \
output.HDMI-A-1.position.0,0 \
output.HDMI-A-1.primary \
\
output.DP-1.disable \
\
output.DP-2.disable \

sleep 2
qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "Toggle Night Color"

sleep 1
qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "Toggle Night Color"

plasmashell --replace &
