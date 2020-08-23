# The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

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

# Examples
puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570