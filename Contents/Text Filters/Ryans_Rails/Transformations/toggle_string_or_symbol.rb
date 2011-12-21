#!/usr/bin/env ruby

# WARNING: this script assumes that whatever you have selected can be transformed
# into a symbol: aka: is not multi-word.

word = $stdin.gets

is_quotes = word.match(/\A['"][\w-]+/)
is_symbol       = word.match(/\A:[\w-]+/)

if is_quotes
  print word.gsub( /\A['"]([\w-]+)["']?/, ':\1' )
end

if is_symbol
  print word.gsub( /\A:([\w-]+)/, '"\1"' )
end
