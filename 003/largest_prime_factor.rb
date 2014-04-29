#!/usr/bin/env ruby

require "prime"

number = (ARGV[0] || 600_851_475_143).to_i
abort("Cannot input a negative number") unless number > 0
print "The largest prime factor of the #{number} is: "
puts Prime.prime_division(number).transpose.first.max
