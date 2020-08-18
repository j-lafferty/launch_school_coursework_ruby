# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

def msg(str)
  puts "=> #{str}"
end

def multiply(num1, num2)
  [num1, num2].reduce(:*)
end

def power(num, raised)
  result = 1
  raised.to_i.times { result = multiply(num.to_i, result) }

  result
end

def display(num, raised)
  msg("#{num} ** #{raised} = #{power(num, raised)}")
end

loop do
  number = nil
  power = nil
  
  loop do
    msg("Enter the number to square: ")
    number = gets.chomp
    
    break if number.to_i.to_s == number
    msg("Invalid input, try again.")
  end

  loop do
    msg("Enter the power of nth: ")
    power = gets.chomp

    break if power.to_i.to_s == power
    msg("Invalid input, try again.")
  end

  display(number, power)

  msg("")
  msg("Do you want to square another number? (y or n)")
  input = gets.chomp.downcase

  break if input == 'n'
end

msg("Goodbye!")

# Example:

# square(5) == 25
# square(-8) == 64