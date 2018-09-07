#!/bin/bash

osascript <<EOF
tell application "Google Chrome"
	set theWindow to window 1
	set theTab to (active tab of theWindow)
	delete theTab
end tell
EOF


