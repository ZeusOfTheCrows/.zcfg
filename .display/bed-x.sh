#!/bin/bash

kscreen-doctor config \
output.HDMI-A-0.enable \
output.HDMI-A-0.mode.1920x1080@60 \
output.HDMI-A-0.position.0,0 \
output.HDMI-A-0.primary \
\
output.DisplayPort-0.disable \
\
output.DisplayPort-1.disable \

sleep 2
qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "Toggle Night Color"

sleep 1
qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "Toggle Night Color"

plasmashell --replace &
