=begin
Write a program that obtains two Integers from the user, then prints the results of dividing the first by the second. The second number must not be 0, and both numbers should be validated using this method:

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end
This method returns true if the input string can be converted to an Integer and back to a string without loss of information, false otherwise. It's not a perfect solution in that some inputs that are otherwise valid (such as 003) will fail, but it is sufficient for this exercise.
=end
def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

num1 = nil
num2 = nil

loop do
  puts "Enter num1:"
  num1 = gets.chomp

  break if valid_number?(num1)
  puts "Invalid input. Only numbers are allowed."
end

loop do
  puts "Enter num2
:"
  num2
 = gets.chomp

  if num2
   == "0"
    puts "Invalid input. 0 is not allowed."
  else 
    break if valid_number?(num2
  )
    puts "Invalid input. Only numbers are allowed."
  end
end

result = num1.to_i / num2.to_i

puts "#{num1} / #{num2} = #{result}"

=begin
Write a program that requests two integers from the user, adds them together, and then displays the result. Furthermore, insist that one of the integers be positive, and one negative; however, the order in which the two integers are entered does not matter.

Do not check for the positive/negative requirement until both integers are entered, and start over if the requirement is not met.

You may use the following method to validate input integers:

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end
=end
def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def user_input
  loop do
    puts "Enter a positive or negative integer:"
    number = gets.chomp
    return number.to_i if valid_number?(number)
    puts "Invalid input. Only non-zero numbers are allowed."
  end
end

num1 = nil
num2 = nil

loop do
  num1 = user_input
  num2 = user_input

  break if num1 > 0 && num2 > 0
  puts "One number must be positive and the other must be negative."
  puts "Please start over."
end

result = num1 + num2

puts "#{num1} + #{num2} = #{result}"
