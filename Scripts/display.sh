#!/bin/bash

[[ "$XDG_SESSION_TYPE" = 'x11' ]] && X=true || X=false

# these might be better as not constants?

TOGGLE_REGEX1="85.+enabled.+Geometry: 0,0 2560x1440"
TOGGLE_REGEX2="86.+enabled.+Geometry: 2560,0 2560x1440"
TOGGLE_REGEX3="88.+enabled"

# INVERT_REGEX="Output: 88 [a-zA-Z:\-,\ ]* Rotation: 1"

get_current_layout () {
	# sed removes colour esc sequences for regex - source:
	# https://superuser.com/questions/380772/removing-ansi-color-codes-from-text-stream
	# -	\x1b (or \x1B) is the escape special character
	# -	(GNU sed does not support alternatives \e and \033)
	# -	\[ is the second character of the escape sequence
	# -	[0-9;]* is the color value(s) regex
	# -	m is used to strip colour escape sequences
	# -	[mGKHF] is used instead to strip all escapes
	#		---+------------------------------------------
	#		 m | Graphics Rendition Mode (including color)
	#		 G | Horizontal cursor move
	#		 K | Horizontal deletion
	#		 H | New cursor position
	#		 F | Move cursor to previous n lines
	#
	# -	[a-zA-Z] could be used instead to unsafely strip all escapes

	# /!\ needs testing wayland
	kscreen-doctor -o | sed "s,\x1B\[[0-9;]*[mGKHF],,g"
}

toggle_current_layout () {

	outputs=$(get_current_layout)

	if [[ "$outputs" =~ $TOGGLE_REGEX1 ]] \
	&& [[ "$outputs" =~ $TOGGLE_REGEX2 ]] && \
	!  [[ "$outputs" =~ $TOGGLE_REGEX3 ]]; then
		switch_to_bed
	else
		switch_to_main
	fi
}

switch_to_main () {
	if $X; then

		kscreen-doctor config \
		output.HDMI-1.disable \
		\
		output.DP-2.enable \
		output.DP-2.mode.2560x1440@75 \
		output.DP-2.position.2560,0 \
		output.DP-2.primary \
		\
		output.DP-1.enable \
		output.DP-1.mode.2560x1440@75 \
		output.DP-1.position.0,0 \

	else

		kscreen-doctor config \
		output.HDMI-A-1.disable \
		\
		output.DP-2.enable \
		output.DP-2.mode.2560x1440@75 \
		output.DP-2.position.2560,0 \
		output.DP-2.primary \
		\
		output.DP-1.enable \
		output.DP-1.mode.2560x1440@75 \
		output.DP-1.position.0,0 \

	fi
}

switch_to_bed () {
	if $X; then

		kscreen-doctor config \
		output.HDMI-1.enable \
		output.HDMI-1.mode.1920x1080@60 \
		output.HDMI-1.position.0,0 \
		output.HDMI-1.primary \
		\
		output.DP-1.disable \
		\
		output.DP-2.disable \

	else

		kscreen-doctor config \
		output.HDMI-A-1.enable \
		output.HDMI-A-1.mode.1920x1080@60 \
		output.HDMI-A-1.position.0,0 \
		output.HDMI-A-1.primary \
		\
		output.DP-1.disable \
		\
		output.DP-2.disable \

	fi
}

invert_bed() {

	# https://libreddit.bus-hit.me/r/kde/comments/o7p72v/

	outputs=$(get_current_layout)
	curr_rotation="$(kscreen-doctor -o | \
		grep 88 | \
		grep -E -o 'Rotation:.........' | \
		grep -o "[1-4]")"

	if [[ $curr_rotation == 1 ]]; then
		# ztodo this might eliminate the need for determining wayland
		echo "normal"
		kscreen-doctor config output.88.rotation.inverted
	else
		echo "inverted"
		kscreen-doctor config output.88.rotation.normal
	fi
}

service_reset () {
	# 	sleep 2
	sleep 0.5
	qdbus org.kde.kglobalaccel /component/kwin \
	org.kde.kglobalaccel.Component.invokeShortcut "Toggle Night Color"

	sleep 0.5
	qdbus org.kde.kglobalaccel /component/kwin \
	org.kde.kglobalaccel.Component.invokeShortcut "Toggle Night Color"

	# recheck monitor ddc capabilities
	# (this works, but there might be a better command)
	sleep 1
	/usr/libexec/org_kde_powerdevil --replace & disown

	# plasmashell --replace &
}

show_help () {
	cat<<'EOF'
 __                     _
(__`. .  ,* |-   _ |_  | \ *  .  _ `|  _ .  , .
,__) \/\/ | \_, (_ | | |_/ | _) |_) \ (_l \/ _)
--------------------------------|--------./----

  -b, --bed: switch to bed layout
  -m, --main: switch to main layout
  -i, --inverted: switch to upside-down bed
  -t, --toggle: toggle between main & bed

  -h, --help: show this message

EOF
}

case $1 in
	'-b' | '--bed')
		switch_to_bed;;

	'-m' | '--main')
		switch_to_main;;

	'-i' | '--inverted')
		invert_bed;;

	'-t' | '--toggle')
		toggle_current_layout;;

	'-h' | '--help' | '' | *)
		show_help;;
esac
