#!/bin/bash

osascript <<EOF
tell application "Firefox"
	activate
end tell

tell application "System Events"
	tell process "Firefox"
		keystroke "r" using {command down}
	end tell
end tell
EOF
