#!/usr/bin/env ruby

max = (ARGV[0] || 1_000).to_i
print "Sum of numbers divisible by 3 or 5 that are below #{max}: "
puts (1...max).select { |n| n % 3 == 0 || n % 5 == 0 }.inject(&:+)
