#!/bin/bash

# help:
# 	exit 3: folder not found

declare -A GAME_FOLDER
GAME_FOLDER+=(
	# https://www.pcgamingwiki.com/wiki/Dark_Souls:_Prepare_to_Die_Edition
	["DS1"]="211420"  # untested
	# https://www.pcgamingwiki.com/wiki/Dark_Souls_Remastered
	["DSR"]="570940"  # untested
	# https://www.pcgamingwiki.com/wiki/Dark_Souls_II
	["DS2"]="236430"  # untested
	# https://www.pcgamingwiki.com/wiki/Dark_Souls_II:_Scholar_of_the_First_Sin
	["DSS"]="335300"  # scholar  # untested
	# https://www.pcgamingwiki.com/wiki/Dark_Souls_III
	["DS3"]="374320"
)

sel_game=${GAME_FOLDER["DS3"]}

STEAM_DIR="$HOME/Games/steamapps/compatdata"
COMPAT_DIR="pfx/drive_c/users/steamuser"
SUFFIX="Archthrones/011000010ce4a15f"

if [ "$sel_game" = "DS1" ]; then
	COMPAT_DIR="$COMPAT_DIR/Documents"
elif [ "$sel_game" = "DSR" ]; then
	COMPAT_DIR="$COMPAT_DIR/AppData/Local"
else
	COMPAT_DIR="$COMPAT_DIR/AppData/Roaming"
fi

SAVE_LOCATION="$STEAM_DIR/$sel_game/$COMPAT_DIR/$SUFFIX"
SAVE_FILE="DS30000.sl2"
NO_OF_BKPS=10

backup_save() {
	cp $SAVE_FILE "$(date -u +%Y-%m-%d--%H-%M).$SAVE_FILE"
}

trim_backups() {
	# make sure dot is there to exclude original
	find -- *.$SAVE_FILE | sort | head -n -$NO_OF_BKPS | xargs -d '\n' rm
}

cd "$SAVE_LOCATION" || exit 3
backup_save
trim_backups

exit 0
