# Create a method that takes two arguments, multiplies them together, and returns the result.

def msg(str)
  puts "=> #{str}"
end

def multiply(num1, num2)
  num1 * num2
end

def display(num1, num2)
  msg("#{num1} * #{num2} = #{multiply(num1, num2)}")
end

msg("Enter the first number: ")
number1 = gets.chomp.to_i

msg("Enter the second number: ")
number2 = gets.chomp.to_i

display(number1, number2)

# Example:

# multiply(5, 3) == 15