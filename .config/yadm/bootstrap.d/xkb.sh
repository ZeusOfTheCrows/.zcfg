#!/bin/bash
# link xkb file to root folder, and add it to evdev

# elevate script:
# https://stackoverflow.com/questions/71622881/how-can-i-request-elevated-permissions-in-a-bash-scripts-begin-and-let-it-go-at
# if [ "$EUID" -ne 0 ]
# then
# 	# rerun same script ($0) with same args ($@)
# 	exec sudo -s "$0" "$@"
# fi

# https://unix.stackexchange.com/questions/26284/how-can-i-use-sed-to-replace-a-multi-line-string

XKB_DIR="/usr/share/X11/xkb"
INFO_LST='zeusmak         gb: English (Zeus Colemak)'
# i can't believe i can't fix the new line issue
# INFO_XML='        <variant>
#           <configItem>
#             <name>zeusmak</name>
#             <description>English (Zeus Colemak)</description>
#           </configItem>
#         </variant>'
# VANILLA_XML='        <variant>
#           <configItem>
#             <name>colemak</name>
#             <description>English (UK, Colemak)</description>
#           </configItem>
#         </variant>'
INFO_XML='        <variant>\n          <configItem>\n            <name>zeusmak</name>\n            <description>English (Zeus Colemak)<\/description>\n          <\/configItem>\n        <\/variant>'
VANILLA_XML='        <variant>\n          <configItem>\n            <name>colemak</name>\n            <description>English (UK, Colemak)<\/description>\n          <\/configItem>\n        <\/variant>'

sed -z "s|$VANILLA_XML|$VANILLA_XML\n$INFO_XML|" $XKB_DIR/rules/evdev.xml | less

# ln -sf "$HOME/.xkb/symbols/gb" "$XKB_DIR/symbols/gb"
# sed -i.original '/colemak.*gb: English (UK, Colemak)/a\'"$INFO_LST" "/usr/share/X11/xkb/rules/evdev.lst"

# sudo sed -i.original "/colemak.*gb: English (UK, Colemak)/a \  $INFO_LST" "$XKB_DIR/rules/evdev.lst"

# to try: https://stackoverflow.com/questions/22716436/bash-script-insert-file-to-xml-file-after-specific-element

# sed "/<\/Students>/ s/.*/${INFO_XML}\n&/" ./.xkb/rules/evdev.xml

# sed -z 's|<description>English\ (UK,\ Colemak)</description>\n</configItem>\n</variant>|a ztest' ./.xkb/rules/evdev.xml
#
# sed 'N;/location \/api.*proxy_pass http:\/\/localhost:8080;/a \    proxy_read_timeout 300;\n    proxy_connect_timeout 300;\n    proxy_send_timeout 300;\n' nginx.conf
#
# sed 'N;/location \/api.*proxy_pass http:\/\/localhost:8080;/a \    proxy_read_timeout 300;\n    proxy_connect_timeout 300;\n    proxy_send_timeout 300;\n' nginx.conf
#
# sed 'N;/location \/api.*proxy.*$/a \    proxy_read_timeout 300;\n    proxy_connect_timeout 300;\n    proxy_send_timeout 300;\n' nginx
#
# sed 'N;/<description>English\ (UK,\ Colemak)<\/description>.*<\/configItem>.*<\/variant>/a \ replaced\ntext' ./.xkb/rules/evdev.xml | nano
#
# sed 'N;/<description>English\ (UK,\ Colemak)<\/description>/a \ ztest\nztest' ./.xkb/rules/evdev.xml | nano
#
# sed 'N;/<description>/,/<\/description>/s/English\ (UK,\ Colemak)/ztest/' ./.xkb/rules/evdev.xml | nano
#
# sed 'N;/<variant>/,/<\/variant>/s/English\ (UK,\ Colemak)/ztest/' ./.xkb/rules/evdev.xml | nano
#
# sed 'N;/\(<variant>/,/<\/variant>\)/s/English\ (UK,\ Colemak)/\1ztest/' ./.xkb/rules/evdev.xml | nano

# reset elevation
# sudo -k
