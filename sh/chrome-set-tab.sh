#!/bin/bash

osascript <<EOF
tell application "Google Chrome"
	set theWindow to window 1
	set (active tab index of theWindow) to ${1:-1}
end tell
EOF

