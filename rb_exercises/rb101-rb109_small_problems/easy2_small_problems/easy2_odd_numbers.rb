# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

# initial solution
(1..99).step(2) {|i| puts i}

# alternate solution
puts (1..99).select(&:odd?)
