tell application "BBEdit"
	
	tell text of front text document
		set oldSelection to selection's characterOffset
		
		set bbFind to find "^( |\\t)*\\S" selecting match false Â
			options {backwards:true, case sensitive:false, extend selection:true, match words:false, returning results:false, search mode:grep, showing results:true, starting at top:false, wrap around:false}
		
		if bbFind's found is true then
			set theStart to bbFind's found object's characterOffset
			set theEnd to theStart + (bbFind's found object's length)
			
			set myTarget to character (theEnd - 2) -- -1 to get to other end of first character, + -1 to get to the start of that
			
			set insertContent to " expect("
			set appendContent to ")"
			set text of myTarget to insertContent
			
			
			set endedText to character (oldSelection + (length of insertContent) - 1)
			
			select insertion point before endedText -- {}
			set text of selection to appendContent			
		end if
	end tell
end tell