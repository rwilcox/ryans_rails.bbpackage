#!/usr/bin/env ruby

text = ARGF.read()
text.match /(\w+)\W+(.+)/

print $~[1]+"(" + $~[2] + ")"
