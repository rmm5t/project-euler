#!/usr/bin/env ruby

number = (ARGV[0] || 1000).to_i
abort("Cannot input a negative number") unless number > 0
print "The largest palindrome created by the product of two positive numbers under #{number} is: "
puts (1...number).flat_map { |n|
  (n...number).flat_map { |t|
    product = (n*t).to_s;
    product.to_i if (product.reverse == product)
  }
}.compact.sort.max