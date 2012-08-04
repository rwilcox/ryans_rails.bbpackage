#!/usr/bin/env ruby
##
# Converts a Ruby single line block to a multi-line one and back again.
#
# Thanks <https://github.com/bnadlerjr/vim-ruby-refactor>

lines = []
while line = $stdin.gets; lines << line.chomp!; end
indent = "%#{lines.first.index(/[^\s]/)}s" % ''

result = []

# Single-line to multi-line
if 1 == lines.length
  parts = lines[0].partition(/\|.+\|/)
  result << parts[0].gsub("{", "do").lstrip + parts[1]
  result << "  " + parts[2].gsub("}", "").strip
  result << "end"
# 3 line to single line
elsif 3 == lines.length
  result << lines[0].gsub("do", "{").strip + " " + lines[1].strip + " }"
# more than 3 lines so do nothing
else
  exit
end

print result.map { |line| indent + line + "\n" }.join('')
