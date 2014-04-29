#!/usr/bin/env ruby

number = (ARGV[0] || 100).to_i
abort("Cannot input a negative number") unless number > 0

# (1+2+3+...n)^2 = ((n^2+n))^2/4
sum_squared = lambda {|n| ((n**2 + n)**2)/4 }
# (1^2 + 2^2 + 3^2+...n^2) = (2n^3+3n^2+n)/6
sum_of_squared_numbers = lambda {|n| (2*(n**3) + 3*(n**2) + n)/6 }

print "(1+2+3+...#{number})^2 - (1^2 + 2^2 + 3^2+...#{number}^2) = "
puts (sum_squared.call(number) - sum_of_squared_numbers.call(number))