#!/bin/bash

osascript <<EOF
tell application "iTerm"
	tell current session of current window
		activate
		write text "!!	"
	end tell
end tell
EOF
