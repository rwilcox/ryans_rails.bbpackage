#!/usr/bin/env python
"""

BBEdit doesn't have support for being able to add additional features to a language. (I know - I asked Rich!).
But some programming languages (like Ruby) do this all the time. Domain Specific Languages and all that jazz.

So, the following is a simple BBEdit script to find and list DSL expressions in a file. I only needed
expressions for Thoughtbot's Shoulda (Ruby) DSL, but I need to extend that pattern to fit other things.

This is a proof-of-concept script. At some point in the future I need to update this script with
support for user specified expressions (RSpec, another Ruby DSL for example). Also, as a file
might contain MULTIPLE DSLs in it (uuggghhh) we need a way to say "Do this file, but only give me
certain expressions".

This would make navigating long files (like you have in Ruby on Rails models) much easier, as these
(at least on some of my current projects for work) contain multiple things - permissioning, workflow,
helper methods, etc... but I, as a user, know that I want to look for only things in the permissioning DSL.

This script outputs two lines for each found line. The first line contains your DSL expression,
and the second line contains the absolute path, including line number, to jump to the location in the file.

Select the path in second line and Use File -> Open File By Name to open your file to the specific spot
(or go to that specific spot in the already opened file).

"""

import os, re, sys

shared_support_path =  os.path.realpath(   os.path.join(  os.path.dirname( os.path.realpath(__file__) ), "..", "..", "..", "..", "SharedSupport"   )   )
sys.path.append( shared_support_path )

import list_statements_matching
context_line = re.compile(r"(\W+?)(context|fast_context)\W(.+)")
should_line = re.compile(r"(\W+?)(should)\W(.+)")
test_line = re.compile(r"(\W+?)(test)\W(.+)")

rspec_it_line = re.compile(r"(\W+?)(it)\W(.+)")
rspec_describe_line = re.compile(r"(\W+?)(describe)\W(.+)")

for match_object, line, line_number in list_statements_matching.list_statements_matching(os.environ["BB_DOC_PATH"], context_line, should_line, test_line, rspec_it_line, rspec_describe_line):
	print line,
	print "    " + match_object.group(1) + os.environ["BB_DOC_PATH"] + ":" + str(line_number)
	print
