#!/usr/bin/env ruby
# http://projecteuler.net/problem=10

require "prime"
max = (ARGV[0] || 2_000_000).to_i
abort("Cannot input a negative number") unless max > 0
print "Sum of primes below #{max}: "
puts Prime.each(max - 1).inject(&:+)
