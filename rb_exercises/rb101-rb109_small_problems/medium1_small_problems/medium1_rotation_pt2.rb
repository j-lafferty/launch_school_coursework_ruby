# Write a method that can rotate the last n digits of a number.

def rotate_array(arr, i)
  rotate_num = arr.delete_at(-i)
  arr << rotate_num
end

def rotate_rightmost_digits(num1, n)
  digits = num1.digits.reverse
  rotate_array(digits, n).join.to_i
end

# For example:
puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917
# Note that rotating just 1 digit results in the original number being returned.

# You may use the rotate_array method from the previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.