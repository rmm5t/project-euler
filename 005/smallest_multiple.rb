#!/usr/bin/env ruby

require "prime"

max = (ARGV[0] || 20).to_i
abort("Cannot input a negative number") unless max > 0
primes = Prime.take_while { |n| n < (max+1) }
highest_prime_divisors = Array.new(primes)
(2...max+1).each { |n|
  if primes.include?(n)
    next
  else
    Prime.prime_division(n).each { |prime|
      prime_factor = prime[0]**prime[1]
      index = primes.find_index(prime[0])
      (highest_prime_divisors[index] = prime_factor) if (highest_prime_divisors[index] < prime_factor)
    }
  end
}
print "The smallest number that can be evenly divided by (1...#{max}): "
puts highest_prime_divisors.inject(:*)