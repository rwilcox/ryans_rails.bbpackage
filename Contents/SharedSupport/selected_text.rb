#!/bin/env ruby

start_reading_at = ENV['BB_DOC_SELSTART'].to_i
stop_reading_at  = ENV["BB_DOC_SELEND"].to_i

File.open(ENV["BB_DOC_PATH"]) do |file|
  file.seek(start_reading_at)
  print file.read(stop_reading_at - start_reading_at)
end
