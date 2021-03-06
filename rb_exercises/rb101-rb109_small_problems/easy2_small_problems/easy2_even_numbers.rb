# Print the even numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

# initial solution
(1..99).each {|i| puts i if i.even?}

# alternate solution
puts (1..99).select(&:even?)