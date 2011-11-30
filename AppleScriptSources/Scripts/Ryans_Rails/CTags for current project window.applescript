tell application "BBEdit"
	-- select the top level item of the project directory
	set runcTagsIn to project window 1's selected items
	if (runcTagsIn is missing value) or runcTagsIn is {} then
		display dialog "plesae select the top level directory!"
	end if
	set uPath to POSIX path of (item 1 of runcTagsIn)
	
	display dialog "Going to run ctags in " & uPath & ". Is this OK?"
	do shell script "cd '" & uPath & "'; /usr/local/bin/bbedit --maketags"
	display dialog "done"
end tell
