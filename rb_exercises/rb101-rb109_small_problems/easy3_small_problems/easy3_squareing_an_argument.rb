# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

def msg(str)
  puts "=> #{str}"
end

def multiply(num1, num2)
  [num1.to_i, num2.to_i].reduce(:*)
end

def square(num)
  multiply(num, num)
end

def display(num)
  msg("#{num} ** 2 = #{square(num)}")
end

loop do
  number = nil
  
  loop do
    msg("Enter the number to square: ")
    number = gets.chomp
    
    break if number.to_i.to_s == number
    msg("Invalid input, try again.")
  end

  display(number)

  msg("")
  msg("Do you want to square another number? (y or n)")
  input = gets.chomp.downcase

  break if input == 'n'
end

msg("Goodbye!")

# Example:

# square(5) == 25
# square(-8) == 64