# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

# initial solution
def stringy(num)
  str = ''
  i = 1

  while i <= num do
    i.odd? ? str << '1' : str << '0'
    i += 1
  end

  str
end

# Examples:
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
# The tests above should print true.
