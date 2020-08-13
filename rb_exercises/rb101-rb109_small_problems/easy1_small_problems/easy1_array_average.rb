# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

def average(arr)
  arr.sum / arr.length
end

# return as Float, rounded to 2 decimal digits
def average_float(arr)
  (arr.sum(0.0) / arr.length).round(2)
end

# Examples:
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
# The tests above should print true.
puts ''
puts average_float([1, 6]) == 3.50 # integer division: (1 + 6) / 2 -> 3
puts average_float([1, 5, 87, 45, 8, 8]) == 25.67
puts average_float([9, 47, 23, 95, 16, 52]) == 40.33
# The tests above should print true.