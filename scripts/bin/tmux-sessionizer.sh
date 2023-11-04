#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
	selected=$1
else
	selected=$(find ~/personal ~/school ~/work ~/work/sensa ~/work/freelance/ ~/work/lyra/ ~/learning -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
	exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
	tmux new-session -ds $selected_name -c $selected
	tmux rename-window -t $selected_name:1 Code
	tmux send-keys -t $selected_name:1 nvim Enter
	tmux new-window -dn Build -c $selected -t $selected_name

	tmux attach-session -dt $selected_name
	exit 0
fi

if ! tmux has-session -t=$selected_name 2>/dev/null; then
	tmux new-session -ds $selected_name -c $selected
	tmux rename-window -t $selected_name:1 Code
	tmux send-keys -t $selected_name:1 nvim Enter
	tmux new-window -dn Build -c $selected -t $selected_name
fi

if [[ -z $TMUX ]]; then
	tmux attach-session -dt $selected_name
	exit 0
fi

tmux switch-client -t $selected_name
