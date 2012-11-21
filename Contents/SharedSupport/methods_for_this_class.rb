#!/bin/env ruby

require 'rubygems'
require 'thread'
require 'active_support'

=begin

methods_for_this_class: because I can never fucking find anything in a Rails app
and I'm sick of looking 3 places for it.

This script displays information about the desired object:

  1. a generated ctags file (you are using ctags, aren't you?)
  2. schema.rb
  3. rake routes > somefile

The METHODS portion of the output has some limitations and some nice features.

First, it will pull even methods from the controller and helper class/module related
to your object. If you're looking for school methods it will pull things from
SchoolController and SchoolHelper. Most of the time this is not what you want,
but some times it will be (imagine a "display_allowed_school_actions_for_current_user" helper
when you're editing something in a view - this method might actually be what you
are searching for.

The limitation is that it uses ctags, which uses static analysis to understand your code.
Thus no delegate methods or magically added methods (I'm looking at you, instance_eval)
are included.

the SCHEMA section of the output lists columns found on the table named #{looking_for.tableize}.
Which is, again, great 95% of the time, but falls down if you're in a class using STI.
But this should not really be that big of a deal.

The ROUTES section of the output uses a generated copy of the `rake routes` output
an greps through it looking for paths that have *something* to do with what you're
looking for. So, if looking for "school" it will find `school`, `new_school`, etc paths.
It will also find things like `new_school_session` and such: nested routes.

The limitation of the ROUTES section is that you have to generate (and keep current)
this cached copy of rake routes.
=end

if true
  look_for = ARGV[0]
  #puts "look_for is #{look_for}"
  TAGFILE = ARGV[1]
  #puts "TAGFILE is #{TAGFILE}"
  SCHEMA_FILE = ARGV[2]
  #puts "SCHEMA_FILE is #{SCHEMA_FILE}"
  GENERATED_ROUTES_FILE = ARGV[3]
  #puts "GENERATED_ROUTES_FILE is #{GENERATED_ROUTES_FILE}"
else
  look_for = "school"
  TAGFILE = "/Users/aias/Temp/fake_rails/tags"
  SCHEMA_FILE = "/Users/aias/Temp/fake_rails/db/schema.rb"
  GENERATED_ROUTES_FILE = "/Users/aias/Temp/fake_rails/tmp/routes.txt"
end

puts "** LOOKING FOR: #{look_for}"
puts
puts "==== METHODS (from ctags) ======================================================"

# first look at ctags for the methods that ctags finds
# This is not a great solution (thanks Ruby for being so dynamic)
# but it's a solution that gets us 80% of the way there
File.open(TAGFILE).each do |line|

  if line.match /class:#{look_for.capitalize}/
    items = line.split("\t")

    print items[0].ljust(30)
    puts items[1].rjust(30)
  end
end

puts
puts "==== SCHEMA ===================================================================="
# now look at schema.rb and look at the defined fields for this table
# Of course, this doesn't work in all situations, like STI, but it's another
# 80% solution
#
# I want to avoid querying Rails directly for this, even though I know that
# I could do this by checking out Object.new.attributes somehow
#
currently_in_block = false
File.open(SCHEMA_FILE).each do |line|

  if currently_in_block
    if line.match /\W+end$/
      currently_in_block = false
      break
    else
      res = line.match /t.(\w+)\W+"(.+?)"/
      type = res[1]
      name = res[2]

      print name.ljust(30)
      puts  type.rjust(30)
    end
  else
    if line.match /create_table "#{look_for.tableize}"/
      currently_in_block = true
    end
  end
end

puts
puts " ==== ROUTES ==================================================================="

if GENERATED_ROUTES_FILE
File.open(GENERATED_ROUTES_FILE).each do |line|
  if line.match /\W+(.\w*(school|assignment).+)\W(POST|GET|PUT|PATCH|DELETE)/
    puts "#{$1}_path"
  end
end
end

