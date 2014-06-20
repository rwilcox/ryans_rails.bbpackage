#!/usr/bin/env ruby

content = ARGF.read()

if content =~ /(\W*)(\S+)\W*=\W*(.+)/
  print "#{$1}let (:#{$2}) { #{$3} }"
else
  print content
end
