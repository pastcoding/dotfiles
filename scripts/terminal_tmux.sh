#!/bin/bash

# List all tmux sessions
SESSIONS=$(tmux list-sessions -F "#S" 2>/dev/null)

# Count the number of sessions
SESSION_COUNT=$(echo "$SESSIONS" | wc -w)

if [ "$SESSION_COUNT" -gt 1 ]; then
	# If there are multiple sessions, use rofi to select one
	SESSION=$(echo "$SESSIONS" | rofi -dmenu -p "Select tmux session")
	if [ -n "$SESSION" ]; then
		# If a session is selected, attach to it
		kitty tmux attach -t "$SESSION"
	fi
elif [ "$SESSION_COUNT" -eq 1 ]; then
	# If there is only one session, attach to it directly
	kitty tmux attach -t "$(echo $SESSIONS)"
else
	# If there are no sessions, create a new one
	kitty tmux new -s Default
fi
