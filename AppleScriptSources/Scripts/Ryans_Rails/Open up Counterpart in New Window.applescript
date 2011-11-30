tell application "BBEdit" to activate

tell application "BBEdit"
	set frontWin to window 1
end tell

tell application "System Events"
	tell process "BBEdit"
		tell menu bar 1
			click menu item "Open Counterpart" of menu "File"
			--sleep 1
			--click menu item "Open In Additional Window" of menu "View"
			tell application "BBEdit"
				open window 1 opening in new_window
				select frontWin
			end tell
			-- the counterpart is already open... go back to the original one
			click menu item "Open Counterpart" of menu "File"
		end tell
	end tell
end tell
