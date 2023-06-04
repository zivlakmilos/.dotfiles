#!/usr/bin/env zsh

displayHelp() {
  echo '|---------------------|'
  echo '|   Workspace Setup   |'
  echo '| © Milos Zivlak 2022 |'
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

  wmctrl -s 1
  (alacritty --title 'Code' --working-directory $workDir) &
  sleep 2

  wmctrl -s 2
  (alacritty --title 'Dev Server' --working-directory $workDir) &
  sleep 1
  (alacritty --title 'Git CLI' --working-directory  $workDir) &
  sleep 1
  (alacritty --title 'Lazy Git' --working-directory $workDir) &
  sleep 2

  wmctrl -s 0
}

startDevelopment2() {
  workDir=$1

  wmctrl -s 3
  (alacritty --title 'Code' --working-directory $workDir) &
  sleep 2

  wmctrl -s 4
  (alacritty --title 'Dev Server' --working-directory $workDir) &
  sleep 1
  (alacritty --title 'Git CLI' --working-directory  $workDir) &
  sleep 1
  (alacritty --title 'Lazy Git' --working-directory $workDir) &
  sleep 2

  wmctrl -s 0
}

startDevelopment3() {
  workDir=$1

  wmctrl -s 5
  (alacritty --title 'Code' --working-directory $workDir) &
  sleep 2

  wmctrl -s 6
  (alacritty --title 'Dev Server' --working-directory $workDir) &
  sleep 1
  (alacritty --title 'Git CLI' --working-directory  $workDir) &
  sleep 1
  (alacritty --title 'Lazy Git' --working-directory $workDir) &
  sleep 2

  wmctrl -s 0
}

startReactNative() {
  startDevelopment $1
}

startReact() {
  startDevelopment $1
}

startWriting() {
  workDir=$1

  wmctrl -s 1
  (marktext $workDir) &
  sleep 2

  wmctrl -s 2
  (alacritty --title 'Build' --working-directory $workDir) &
  sleep 2

  wmctrl -s 0
}

startP5() {
  workDir=$1

  wmctrl -s 1
  (alacritty --title 'Code' --working-directory $workDir) &
  sleep 2

  wmctrl -s 2
  (google-chrome-stable --incognito) &
  sleep 1
  (alacritty --title 'Build' --working-directory $workDir) &
  sleep 2

  wmctrl -s 0
}

startTimeManagement() {
  wmctrl -s 7

  (superproductivity) &
  sleep 1
  (focalboard-bin) &
  sleep 2

  wmctrl -s 0
}

startOrganization() {
  tm=$1

  wmctrl -s 7
  sleep 1

  xdotool key Super+shift+f
  sleep 1

  (focalboard-bin) &
  sleep 1
  (obsidian) &
  sleep 3

  if [ $tm ]
  then
    (superproductivity) &
    sleep 1
  fi

  sleep 2

  wmctrl -s 0
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
