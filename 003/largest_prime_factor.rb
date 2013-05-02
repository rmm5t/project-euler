#!/usr/bin/env ruby

require "prime"

number = (ARGV[0] || 600_851_475_143).to_i
print "The largest prime factor of the #{number} is: "
puts Prime.prime_division(number).flatten.max
