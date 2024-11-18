#!/usr/bin/env bash

tmux_status_bar_pid=$(tmux show-environment tmux_status_bar_pid)
kill -9 $tmux_status_bar_pid



~/.config/tmux/scripts/smart_tmux_status.bash &
pid=$!
tmux set-environment -g tmux_status_bar_pid "$tmux_status_bar_pid"
