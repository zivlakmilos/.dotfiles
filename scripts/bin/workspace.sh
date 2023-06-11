#!/usr/bin/env zsh

displayHelp() {
	echo '|---------------------|'
	echo '|   Workspace Setup   |'
	echo '| © Milos Zivlak 2023 |'
	echo '|---------------------|'
	echo ''
	echo 'Options:'
	echo '  - help'
	echo '  - dev | development'
	echo '    - Directory path'
	echo '  - dev2 | development2'
	echo '    - Directory path'
	echo '  - dev2 | development2'
	echo '    - Directory path'
	echo '  - rn | react-native'
	echo '    - Directory path'
	echo '  - react'
	echo '    - Directory path'
	echo '  - writing'
	echo '    - Directory path'
	echo '  - p5'
	echo '    - Directory path'
	echo '  - tm | time-management'
	echo '  - org | organization'
	echo '    - Time tracking (true/false) [optional, default false]'
}

startDevelopment() {
	workDir=$1

	i3-msg "workspace2; exec alacritty --title 'Code' --working-directory $workDir" >/dev/null
	sleep 1

	i3-msg "workspace3; exec alacritty --title 'Dev Server' --working-directory $workDir" >/dev/null
	i3-msg "workspace3; exec alacritty --title 'Git' --working-directory $workDir" >/dev/null
	sleep 2

	i3-msg workspace1 >/dev/null
}

startReactNative() {
	startDevelopment $1
}

startReact() {
	startDevelopment $1
}

startWriting() {
	workDir=$1

	i3-msg workspace2 >/dev/null
	i3-msg exec "marktext $workDir" >/dev/null
	sleep 1

	i3-msg workspace3 >/dev/null
	i3-msg exec "alacritty --title 'Build' --working-directory $workDir" >/dev/null
	sleep 1

	i3-msg workspace1 >/dev/null
}

startP5() {
	workDir=$1

	i3-msg workspace2 >/dev/null
	i3-msg exec "alacritty --title 'Code' --working-directory $workDir" >/dev/null
  sleep 1

	i3-msg workspace3 >/dev/null
	i3-msg exec "google-chrome-stable --incognito" >/dev/null
	i3-msg exec "alacritty --title 'Build' --working-directory $workDir" >/dev/null
  sleep 1

	i3-msg workspace1 >/dev/null
}

startTimeManagement() {
	i3-msg workspace9 >/dev/null
	i3-msg exec "superproductivity" >/dev/null
	i3-msg exec "focalboard-bin" >/dev/null

	(superproductivity) &
	sleep 1
	(focalboard-bin) &
	sleep 2

	i3-msg workspace1 >/dev/null
}

startOrganization() {
	tm=$1

	startTimeManagement
}

case $1 in
help)
	displayHelp
	;;
dev | development)
	startDevelopment $2
	;;
dev2 | development2)
	startDevelopment2 $2
	;;
dev3 | development3)
	startDevelopment3 $2
	;;
rn | react-native)
	startReactNative $2
	;;
react)
	startReact $2
	;;
writing)
	startWriting $2
	;;
p5)
	startP5 $2
	;;
tm | time-management)
	startTimeManagement $2
	;;
org | organization)
	startOrganization $2
	;;
esac
