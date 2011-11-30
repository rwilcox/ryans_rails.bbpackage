import fileinput

def list_statements_matching(filepath, *regexes):
	i = 1
	for line in fileinput.input( filepath ):
		# grep over every line in the file, extracting the name of the function
		for possible in regexes:
			match_object = possible.match(line)
			if match_object:
				yield match_object, line, i
				break
		i = i + 1
