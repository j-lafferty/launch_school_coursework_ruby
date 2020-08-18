# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

# constant array of symbols
OPERATORS = %i(+ - * / % **) # see ruby-doc/syntax/literals/percent-strings

def msg(str)
  puts "=> #{str}"
end

def arithmetic(num1, num2, sym)
  [num1, num2].reduce(sym)
end

def display(num1, num2, op)
  op.each do |sym|
    msg("#{num1} #{sym} #{num2} = #{arithmetic(num1, num2, sym)}")
  end
end

puts "Enter the first number: "
number1 = gets.chomp.to_i

puts "Enter the second number: "
number2 = gets.chomp.to_i

display(number1, number2, OPERATORS)

# Example

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103