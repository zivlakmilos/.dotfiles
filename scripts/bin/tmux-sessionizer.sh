#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find ~/personal ~/school ~/work ~/work/*/ ~/learning/ ~/learning/*/ ~/tmp/ -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -ds $selected_name -c $selected

  if [ -f "$selected/.tmux-sessionizer" ]; then
    tmux send-keys -t "$selected_name" "source $selected/.tmux-sessionizer" c-M
  elif [ -f "$HOME/.tmux-sessionizer" ]; then
    tmux send-keys -t "$selected_name" "source $HOME/.tmux-sessionizer" c-M
  fi

  tmux attach-session -dt $selected_name
  exit 0
fi

if ! tmux has-session -t=$selected_name 2>/dev/null; then
  tmux new-session -ds $selected_name -c $selected

  if [ -f "$selected/.tmux-sessionizer" ]; then
    tmux send-keys -t "$selected_name" "source $selected/.tmux-sessionizer" c-M
  elif [ -f "$HOME/.tmux-sessionizer" ]; then
    tmux send-keys -t "$selected_name" "source $HOME/.tmux-sessionizer" c-M
  fi
fi

if [[ -z $TMUX ]]; then
  tmux attach-session -dt $selected_name
  exit 0
fi

tmux switch-client -t $selected_name
