# Create a method that takes two arguments, multiplies them together, and returns the result.

def msg(str)
  puts "=> #{str}"
end

def multiply(num1, num2)
  [num1.to_i, num2.to_i].reduce(:*)
end

def display(num1, num2)
  msg("#{num1} * #{num2} = #{multiply(num1, num2)}")
end

loop do
  number1 = nil
  number2 = nil
  
  loop do
    msg("Enter the first number: ")
    number1 = gets.chomp
    
    break if number1.to_i.to_s == number1
    msg("Invalid input, try again.")
  end

  loop do
    msg("Enter the second number: ")
    number2 = gets.chomp
    
    break if number2.to_i.to_s == number2
    msg("Invalid input, try again.")
  end

  display(number1, number2)

  msg("")
  msg("Do you want to multiply other numbers? (y or n)")
  input = gets.chomp.downcase

  break if input == 'n'
end

msg("Goodbye!")

# Example:

# multiply(5, 3) == 15