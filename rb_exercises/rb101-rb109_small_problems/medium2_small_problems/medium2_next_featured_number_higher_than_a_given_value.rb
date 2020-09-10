# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.

def is_featured_nbr(n)
  n_chars = n.to_s.chars
  n_chars.uniq == n_chars
end

def error_msg()
  puts "There is no possible number that fulfills those requirements."
end

def featured(num)
  num += 1
  num += 1 until num.odd? && num % 7 == 0

  loop do
    return num if is_featured_nbr(num)
    num += 7
    break if num >= 9_876_543_210
  end

  error_msg()
end

# Examples:

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
# puts featured(1029) == 1043
# puts featured(999_999) == 1_023_547
# puts featured(999_999_987) == 1_023_456_987

puts featured(9_999_999_999) # -> There is no possible number that fulfills those requirements