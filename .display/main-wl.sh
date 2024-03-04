#!/bin/bash

kscreen-doctor config \
output.HDMI-A-1.disable \
\
output.DP-1.enable \
output.DP-1.mode.2560x1440@75 \
output.DP-1.position.2560,0 \
output.DP-1.primary \
\
output.DP-2.enable \
output.DP-2.mode.2560x1440@75 \
output.DP-2.position.0,0 \

sleep 2
qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "Toggle Night Color"

sleep 1
qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "Toggle Night Color"

plasmashell --replace &
