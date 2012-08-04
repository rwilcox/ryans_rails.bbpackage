#!/usr/bin/env ruby
##
# Converts a Ruby post conditional to a multi-line one and back again.
#
# Thanks <https://github.com/bnadlerjr/vim-ruby-refactor>
#

lines = []
while line = $stdin.gets; lines << line.chomp!; end
indent = "%#{lines.first.index(/[^\s]/)}s" % ''

command = lines[0].match(/(if|unless)/).to_s
exit if '' == command

result = []

# Single-line to multi-line
if 1 == lines.length
  statement, condition = lines[0].split(command)
  result << command + ' ' + condition.strip
  result << "  #{statement.strip}"
  result << "end"
# 3 line to single line
elsif 3 == lines.length
  result << lines[1].strip + ' ' + lines[0].strip
# more than 3 lines so do nothing
else
  exit
end

print result.map { |line| indent + line + "\n" }.join('')
