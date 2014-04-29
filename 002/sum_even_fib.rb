#!/usr/bin/env ruby

fibonaccis = Fiber.new do
  a, b = 0, 1
  Fiber.yield a
  Fiber.yield b
  loop do
    c = a + b
    a, b = b, c
    Fiber.yield c
  end
end

max = (ARGV[0] || 4_000_000).to_i
abort("Cannot input a negative number") unless max > 0
sum = 0
loop do
  n = fibonaccis.resume
  break if n > max
  sum += n if n.even?
end

print "Sum of the even Fibonacci values that do not exceed #{max}: "
puts sum
