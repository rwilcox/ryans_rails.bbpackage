tell application "BBEdit"
	activate
	select Open File by Name window
	tell application "System Events"
		keystroke "schema.rb"
		keystroke return
	end tell
	
end tell