#!/usr/bin/env ruby

number = (ARGV[0] || 1000).to_i
res = 1
(1...number).each_entry { |n|
  ((n)...number).each_entry { |t|
    product = (t*n).to_s
    (res = product.to_i) if (product.reverse == product && product.to_i > res)
  }
}
print "The largest palindrome created by the product of two positive numbers under #{number} is: "
puts res
