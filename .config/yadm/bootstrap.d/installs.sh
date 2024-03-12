#!/bin/bash
# install some pretty useful programmes

# elevate script:
# https://stackoverflow.com/questions/71622881/how-can-i-request-elevated-permissions-in-a-bash-scripts-begin-and-let-it-go-at
if [ "$EUID" -ne 0 ]
then
	# rerun same script ($0) with same args ($@)
	exec sudo -s "$0" "$@"
fi

#ztodo these could be in separate files for easier editing?
forInstallMinimal=(\
	# cli
	'bat'\
	'eza'\
	'micro'\
)
forInstallBasic=(\
	# cli
	'tldr'\
	# gui
	'steam'\
	'copyq'\
	'haruna'\
	'yakuake'\
	'antimicrox'\
	'qbittorrent'\
	'telegram-desktop'\
)
forInstallFull=(\
	# cli
	'gh'\
	'ugrep'\
	'nordvpn'\
	'xrestrict'\
	# gui
	'gimp'\
	'meld'\
	'nheko'\
	'piper'\
	'kdiff3'\
	'okteta'\
	'catfish'\
	'inkscape'\
	'qownnotes'\
	'ghostwriter'\
	'protonup-qt'\
	'plasma-oxygen'\  # this may be named differently...
	'torbrowser-launcher'\
)

# untested: https://unix.stackexchange.com/questions/46081/identifying-the-system-package-manager
# comments below are guesses
declare -A installCommands;
	installCommands[/etc/redhat-release]="dnf install"
	installCommands[/etc/arch-release]="pacman -S"
	installCommands[/etc/SuSE-release]="zypper install"
	installCommands[/etc/debian_version]="apt install"

for f in "${!installCommands[@]}"; do  # loop through ↑ array
	if [[ -f $f ]];then
		selectInstallCommand=${installCommands[$f]}
	fi
done

# https://web.archive.org/web/https://gist.github.com/davejamesmiller/1965569
ask() {
	local prompt default reply

	if [[ ${2:-} = 'Y' ]]; then
		prompt='Y/n/^c'
		default='Y'
	elif [[ ${2:-} = 'N' ]]; then
		prompt='y/N/^c'
		default='N'
	else
		prompt='y/n/^c'
		default=''
	fi

	while true; do

	# Ask the question (not using "read -p" as it uses stderr not stdout)
	echo -n "$1 [$prompt] "

	# Read the answer (use /dev/tty in case stdin is redirected from
	# somewhere else) (actually don't do this so i can use "yes")
	read -r -n 1 reply

	# Default?
	if [[ -z $reply ]]; then
		reply=$default
	fi

	# Check if the reply is valid. man, bash case statements are weird
	case "$reply" in
		Y*|y*) return 0 ;;
		N*|n*) return 1 ;;
	esac

	done
}


queryInstallType() {
	read -n 1 -rp $'select install type:
		0) Cancel Installation
		1) Minimal (For temporary installs)
		2) Basic (Most `useful\' programmes)
		3) Full (Permanent main installation)
	Choose Selection [0..3] ' installType

# 	echo

	# doesn't really need to be nested, but looks prettier

	# https://devhints.io/bash#conditionals
	if [[ $installType -eq 0 ]]; then
		exit 0  # possibly exit 1? but i think it's "not an error, intended exit"
	else
		local forInstall
		if [[ $installType -ge 1 ]]; then  # greater than or equal to
			forInstall+="${forInstallMinimal[*]}"
		fi
		if [[ $installType -ge 2 ]]; then
			forInstall+="${forInstallBasic[*]}"
		fi
		if [[ $installType -ge 3 ]]; then
			forInstall+="${forInstallFull[*]}"
		fi
	fi

	# echo works like return in bash; return works like exit
	echo "${forInstall}"
}

forInstall=$(queryInstallType)

finalCommand="$selectInstallCommand ${forInstall}"

# "\n" does not work inside double quotes.
# i do not fucking know why. it needs $'\n'

# ask $'\n'"running \"$output\""$'\nis this correct?' Y\
# && $finalCommand || forInstall=$(queryInstallType); checkIfOK

executeIfOK() {
	if ask $'\n'"running \"$(tput setaf 4 bold)$finalCommand$(tput sgr0)\""$'\nis this correct?' Y; then
		$finalCommand
	else
		forInstall=$(queryInstallType)
		executeIfOK
	fi
}

executeIfOK

elevation
sudo -k
