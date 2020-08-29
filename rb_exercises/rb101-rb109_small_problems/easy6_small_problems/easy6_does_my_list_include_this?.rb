# Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

# could have used #any?, but that seemed too similar to #include?
# def include?(arr, num)
#   arr.select { |i| i == num }.size > 0
# end

# alternate solution
def include?(arr, num)
  arr.count { |i| i == num } > 0
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false