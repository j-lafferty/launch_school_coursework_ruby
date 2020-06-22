# ask the user for two numbers
# ask the user for an operation to perform
# peform the operation on the two number
# output the results

def prompt(message)
  puts "=> #{message}"
end

prompt("Welcome to Calculator!")
prompt("Please enter the firt number")
number1 = gets.chomp

prompt("Please enter the second number")
number2 = gets.chomp

prompt("What operation would you like to perform on these two numbers?")
prompt("--Add")
prompt("--Subtract")
prompt("--Multiply")
prompt("--Divide")
operation = gets.chomp.downcase

case operation
when 'add' then prompt("#{number1} + #{number2} = #{number1.to_i + number2.to_i}")
when 'subtract' then prompt("#{number1} - #{number2} = #{number1.to_i - number2.to_i}")
when 'multiply' then prompt("#{number1} * #{number2} = #{number1.to_i * number2.to_i}")
when 'divide' then prompt("#{number1} / #{number2} = #{number1.to_f / number2.to_f}")
else prompt("Incorrect operation selection")
end

