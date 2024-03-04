#!/bin/bash

kscreen-doctor config \
output.HDMI-A-0.disable \
\
output.DisplayPort-0.enable \
output.DisplayPort-0.mode.2560x1440@75 \
output.DisplayPort-0.position.2560,0 \
output.DisplayPort-0.primary \
\
output.DisplayPort-1.enable \
output.DisplayPort-1.mode.2560x1440@75 \
output.DisplayPort-1.position.0,0 \

sleep 2
qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "Toggle Night Color"

sleep 1
qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "Toggle Night Color"

# (this works, but there might be a better command)
/usr/libexec/org_kde_powerdevil --replace

# plasmashell --replace &
