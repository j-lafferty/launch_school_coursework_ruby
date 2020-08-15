# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

def msg(str)
  puts "=> #{str}"
end

def sum(number)
  (1..number).reduce(:+) # (:+) same as { |sum, i| sum += i }
end

def product(number)
  (1..number).reduce(:*) # (:*) same as { |product, i| product *= i }
end

def calculate(input, number)
  case input
  when 's' then sum(number)
  when 'p' then product(number)
  end
end

def display(input, number, result)
  case input
  when 's' then msg("The sum of the integers between 1 and #{number} is #{result}.")
  when 'p' then msg("The product of the integers between 1 and #{number} is #{result}.")
  end
end

number = nil
loop do
  msg("Please enter an integer greater than 0: ")
  number = gets.chomp.to_i

  break if number > 0
  msg("Invalid entry, please try again.")
end

input = nil
loop do
  msg("Enter 's' to compute the sum, 'p' to compute the product.")
  input = gets.chomp.downcase

  break if input == 's' || input == 'p'
  msg("Invalid entry, please try again.")
end

result = calculate(input, number)

display(input, number, result)


# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.