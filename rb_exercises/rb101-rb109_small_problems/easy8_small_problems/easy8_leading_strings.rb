# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

# def leading_substrings(str)
#   sub_str = []
#   str.length.times { |i| sub_str << str[0..i] }
#   sub_str
# end

# refactored
def leading_substrings(str)
  (0..str.length - 1).map { |i| str[0..i] }
end

# Examples:

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']