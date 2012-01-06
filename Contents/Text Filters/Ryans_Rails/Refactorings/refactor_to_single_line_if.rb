#!/usr/bin/env ruby

path = File.dirname( ENV["BB_DOC_PATH"] )
name = ENV["BB_DOC_NAME"]

=begin

The idea here is that a user can select a small if statement and refactor it into a single line if.

Example:

  if 1 < 3
    print "all is safe with the universe"
  end

This script transforms that statement to:

  print "all is safe with the universe" if 1 < 3

This script is very dumb, and just joins these two lines.
=end

lines = ARGF.read.split("\n")

if_condition = lines[0].strip
statement = lines[1].rstrip[2..-1] # remove the trailing whitespace and return that might be there

puts "#{statement} #{if_condition}"
