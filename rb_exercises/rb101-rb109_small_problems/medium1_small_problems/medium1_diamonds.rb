# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

def star(num, i)
  puts ("*" * i).center(num)
end

def top(num)
  star(num, 1) if num == 1
  1.step(num - 2, 2) { |i| star(num, i) }
end

def bottom(num)
  (num).step(1, -2) { |i| star(num, i) }
end

def diamond(num)
  top(num)
  bottom(num) if num > 1
end

# Examples

diamond(1)

# *
diamond(3)

#  *
# ***
#  *
diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *