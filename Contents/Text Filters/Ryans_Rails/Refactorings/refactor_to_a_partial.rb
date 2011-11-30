#!/usr/bin/env ruby

path = File.dirname( ENV["BB_DOC_PATH"] )
name = ENV["BB_DOC_NAME"]
name_without_extension = name.split(".")[0]

temp_partial_name_no_extension = "NEW_PARTIAL_" << name_without_extension
temp_partial_name = "NEW_PARTIAL_" << name
new_partial_filepath = File.join(path, "_" + temp_partial_name)

File.open( new_partial_filepath, "a" ) do |f|
  f.puts ARGF.read
end

puts "render :partial => '#{temp_partial_name_no_extension}'"
