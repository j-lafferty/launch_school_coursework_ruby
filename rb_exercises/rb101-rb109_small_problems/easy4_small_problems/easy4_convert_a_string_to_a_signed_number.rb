# Convert a String to a Signed Number!
# In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

DIGIT_HASH = Hash[('0'..'9').to_a.zip((0..9).to_a)]

def base_ten(num, i)
  num * (10 ** i)
end

def string_to_integer(str)
  # reverse for base ten during loop iteration
  num_arr = str.chars.reverse 
  
  total = 0
  
  num_arr.length.times do |i|
    value = DIGIT_HASH[num_arr[i]]
    total += base_ten(value, i)
  end

  total
end

def string_to_signed_integer(str)
  sign = str.slice!(0) if str[0] == '-' || str[0] == '+'

  value = string_to_integer(str)

  sign == '-' ? -value : value
end


# Examples
puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100