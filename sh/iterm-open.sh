#!/bin/bash

osascript <<EOF
tell application "iTerm"
	create window with default profile
	tell current session of current window
		activate
		write text "cd \"$1\""
	end tell
end tell
EOF
