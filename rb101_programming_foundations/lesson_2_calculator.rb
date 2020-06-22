# ask the user for two numbers
# ask the user for an operation to perform
# peform the operation on the two number
# output the results

puts "Welcome to Calculator!"
puts "Please enter the firt number"
number1 = gets.chomp

puts "Please enter the second number"
number2 = gets.chomp

puts "What operation would you like to perform on these two numbers?"
puts "--Add"
puts "--Subtract"
puts "--Multiply"
puts "--Divide"
operation = gets.chomp.downcase

case operation
when 'add' then puts "#{number1} + #{number2} = #{number1.to_i + number2.to_i}"
when 'subtract' then puts "#{number1} - #{number2} = #{number1.to_i - number2.to_i}"
when 'multiply' then puts "#{number1} * #{number2} = #{number1.to_i * number2.to_i}"
when 'divide' then puts "#{number1} / #{number2} = #{number1.to_f / number2.to_f}"
else puts "Incorrect operation selection"
end

