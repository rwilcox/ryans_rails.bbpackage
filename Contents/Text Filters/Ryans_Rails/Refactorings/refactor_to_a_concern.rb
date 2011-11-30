#!/usr/bin/env ruby

path = File.dirname( ENV["BB_DOC_PATH"] )
name = ENV["BB_DOC_NAME"]
name_without_extension = name.split(".")[0]

# first, create a new file, named FILENAME_module
# I'll let the user rename as they see fit

concern_folder = File.join(path, name_without_extension + "_concerns")
unless File.exists?(concern_folder)
  Dir.mkdir(concern_folder)
end

new_module_filepath = File.join(concern_folder, name_without_extension + "_module.rb")

new_file = File.exists?(new_module_filepath)
File.open( new_module_filepath, "a" ) do |f|
  unless new_file
    f.puts "module ChangeMe"
    f.puts "  extend ActiveSupport::Concern"
    f.puts
    f.puts "  module ClassMethods"
    f.puts
    f.puts "  end"
    f.puts
    f.puts "  module InstanceMethods"
    f.puts
    f.puts "  end"
    f.puts "end #module ChangeMe"
  end

  f.puts
  f.puts "# ==================================================="
  f.puts "# Insert the following code in the proper places in the structure"
  f.puts

  f.puts ARGF.read
end

puts "" # remove it from the original file
