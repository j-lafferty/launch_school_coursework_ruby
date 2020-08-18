# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# return array of even index items (or odd elements)
def oddities(arg)
  arg.reject { |i| arg.index(i).odd? }
end

# return array of even index items (or odd elements)
def oddities2(arg)
  arg.select { |i| arg.index(i).even? }
end

# return array of odd index items (or even elements)
def evens(arg)
  arg.reject { |i| arg.index(i).even? }
end

# return array of odd index items (or even elements)
def evens2(arg)
  arg.select { |i| arg.index(i).odd? }
end

# Examples:
# all puts true
puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

# Examples:
# all puts true
puts oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities2([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities2(['abc', 'def']) == ['abc']
puts oddities2([123]) == [123]
puts oddities2([]) == []

# Examples:
# all puts true
puts evens([2, 3, 4, 5, 6]) == [3, 5]
puts evens([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts evens(['abc', 'def']) == ['def']
puts evens([123]) == []
puts evens([]) == []

# Examples:
# all puts true
puts evens2([2, 3, 4, 5, 6]) == [3, 5]
puts evens2([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts evens2(['abc', 'def']) == ['def']
puts evens2([123]) == []
puts evens2([]) == []