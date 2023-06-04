#! /usr/bin/env zsh

selected=$(find ~/projects ~/ ~/work ~/personal -mindepth 1 -maxdepth 1 -type d | fzf)
workspace.sh dev $selected
