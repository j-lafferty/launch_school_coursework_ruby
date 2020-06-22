# ask the user for two numbers
# ask the user for an operation to perform
# peform the operation on the two number
# output the results

puts "Welcome to Calculator!"
puts "Please enter the firt number"
number1 = gets.chomp.to_i

puts "Please enter the second number"
number2 = gets.chomp.to_i

puts "What operation would you like to perform on these two numbers?"
puts "--Add"
puts "--Subtract"
puts "--Multiply"
puts "--Divide"
operation = gets.chomp.downcase

case operation
when 'add' then puts "#{number1} + #{number2} = #{number1 + number2}"
when 'subtract' then puts "#{number1} - #{number2} = #{number1 - number2}"
when 'multiply' then puts "#{number1} * #{number2} = #{number1 * number2}"
when 'divide' then puts "#{number1} / #{number2} = #{number1 / number2}"
else puts "Incorrect operation selection"
end

