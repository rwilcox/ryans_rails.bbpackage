#!/usr/bin/env ruby

no_assignments = ARGF.read.gsub(/<%=/, '')
no_assignments.gsub!(/<%-/, '')
no_assignments.gsub!(/<%#/, '')
no_assignments.gsub!(/<%/, '')
no_assignments.gsub!(/-%>/, '')
no_assignments.gsub!(/%>/, '')

puts no_assignments