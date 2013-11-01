tell application "BBEdit"
	set full_migration_name to name of active document of window 1
	
	set oldDelim to AppleScript's text item delimiters
	
	set AppleScript's text item delimiters to "_"
	
	set output to first text item of full_migration_name
	set AppleScript's text item delimiters to oldDelim
	
	set the clipboard to output
end tell

