tell application "BBEdit"
	set runcTagsIn to project window 1's selected items
	if (runcTagsIn is missing value) or runcTagsIn is {} then
		display dialog "plesae select the top level directory!"
	end if
	set uPath to POSIX path of (item 1 of runcTagsIn)
	return uPath
end tell