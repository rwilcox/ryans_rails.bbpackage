#!/usr/bin/env python

import os
import re
import sys
import commands

def rails_path():
  return commands.getstatusoutput(""" cd "$(dirname "$BB_DOC_PATH")";  git rev-parse --show-toplevel""")[1]

function_def = re.compile(r'\W*def\W*(\w+)')
project_root = rails_path()

controller_name, junk = os.environ["BB_DOC_NAME"].split("_controller")
function_definitions = []

with open( os.environ["BB_DOC_PATH"] ) as f:
  current_line_number = 0
  for line in f:
    current_line_number=current_line_number+1
    res = function_def.match(line)
    if res:
      function_definitions.append( res.groups(1)[0] ) # not really sure why res.groups returns a tuple. WD-rpw 11-06-2012
    if ( current_line_number > int(os.environ['BB_DOC_SELEND_LINE']) ):
      break

  current_function = function_definitions[-1]
  view_file_name = current_function

  the_command = "/usr/local/bin/bbedit " + project_root + "/app/views/" + controller_name + "/" + view_file_name + "* --project"
  os.system(the_command)   # not sure if I like the --project, but it's the only way??? to deal with multiple formats
