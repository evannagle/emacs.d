#!/bin/bash

osascript <<EOF
tell application "Google Chrome"
	set theWindows to (every window)
	set theWindowCount to (count theWindows)
	
	if theWindowCount = 0 then
		make new window
	end if
	
	repeat with theWindow in theWindows
		set theTab to the active tab of theWindow
		set theTabsUrl to (theTab's URL) as string
		if theTabsUrl does not start with "chrome-devtools:" then
			set URL of theTab to theTabsUrl
		end if
	end repeat
end tell
EOF
