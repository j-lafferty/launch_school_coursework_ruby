# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

# initial solution
# def running_total(arr)
#   sum = 0
#   arr.map {|i| sum += i}
# end

# refactored solution
# returns new array where arr index i == sum of all values between arr[0] and arr[i]
def running_total(arr)
  arr.map.with_index { |_, i| arr[0..i].sum }
end

# Examples:
puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []