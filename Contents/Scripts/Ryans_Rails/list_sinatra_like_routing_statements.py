#!/usr/bin/env python

import os, re, sys

shared_support_path =  os.path.realpath(   os.path.join(  os.path.dirname( os.path.realpath(__file__) ), "..", "..", "SharedSupport"   )   )
sys.path.append( shared_support_path )

import list_statements_matching

routing_line = re.compile(r"(\W+?)(get|post|put|patch|delete)\W(.+)")

for match_object, line, line_number in list_statements_matching.list_statements_matching( os.environ["BB_DOC_PATH"], routing_line ):
	print line,
	print "    " + match_object.group(1) + os.environ["BB_DOC_PATH"] + ":" + str(line_number)
	print
