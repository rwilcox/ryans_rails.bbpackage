#!/usr/bin/env ruby

path = File.dirname( ENV["BB_DOC_PATH"] )
name = ENV["BB_DOC_NAME"]

all_lines = ARGF.read

object_instance = all_lines.match  /(@\w+)/
output = "    respond_with "
if object_instance
  output << "#{object_instance[1]}"
else
  output << "<##>"
end

puts output
