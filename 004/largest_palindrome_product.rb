#!/usr/bin/env ruby

max = (ARGV[0] || 1000).to_i
abort("Cannot input a negative number") unless max > 0
print "The largest palindrome created by the product of two positive numbers under #{max} is: "
puts (1...max).flat_map { |n|
  (n...max).flat_map { |t|
    product = (n*t).to_s;
    product.to_i if (product.reverse == product)
  }.compact
}.max