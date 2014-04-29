
require "matrix"
require "bitset"

max = (ARGV[0] || 1500000).to_i


m = Matrix.row_vector([3,4,5])

A = Matrix.rows([[1,-2,2],[2,-1,2],[2,-2,3]])
B = Matrix.rows([[1,2,2],[2,1,2],[2,2,3]])
C = Matrix.rows([[-1,2,2],[-2,1,2],[-2,2,3]])

Transformations = [A,B,C]

# Because Matrix math is not multiplying vectors correctly, implement method that works for vector of length three, and vector of 9

multiply = lambda { |row, matrix|
  Matrix.row_vector([row[0,0]*matrix[0,0]+row[0,1]*matrix[0,1]+row[0,2]*matrix[0,2],
  row[0,0]*matrix[1,0]+row[0,1]*matrix[1,1]+row[0,2]*matrix[1,2],
  row[0,0]*matrix[2,0]+row[0,1]*matrix[2,1]+row[0,2]*matrix[2,2]])
}
sum = lambda { |row| row.each().inject(:+) }

primitive_pythagorean_triple_lengths = []
primitive_pythagorean_triple_lengths << sum.call(m)

# Create unique pythagorean triples, and add length to array of lengths

apply_transformations = lambda { |row|
  new_triples = Transformations.map { |t| multiply.call(row,t) }
  sums = new_triples.map { |triple| sum.call(triple) }
  sums.each { |s| primitive_pythagorean_triple_lengths << s if (s < max)}
  new_triples.each_with_index { |triple, index| apply_transformations.call(triple) if (sums[index] < max)}
}
apply_transformations.call(m)

# Sieve for unique multiples of values
# essentially a*set(n) % b*set(all other values) != 0, for all n, a, and b

limit = max/2
count = 0;
unique_lengths = Bitset.new(limit)
non_unique_lengths = Bitset.new(limit)

primitive_pythagorean_triple_lengths.each { |length|
  length/=2
  l = length
  while(l < limit)
    if (!non_unique_lengths[l])
      if (unique_lengths[l])
        non_unique_lengths.set l
        unique_lengths.clear l
        count-=1
      else
        unique_lengths.set l
        count+=1
      end
    end
    l+=length
  end
}
print "The number of integer triangles (a^2 + b^2 = c^2) with a unique perimeter under #{max} is: #{count}"