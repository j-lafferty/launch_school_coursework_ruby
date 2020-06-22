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

result = case operation
         when 'add' then number1.to_i + number2.to_i
         when 'subtract' then number1.to_i - number2.to_i
         when 'multiply' then number1.to_i * number2.to_i
         when 'divide' then number1.to_f / number2.to_f
end

sign = case operation
       when 'add' then '+'
       when 'subtract' then '-'
       when 'multiply' then '*'
       when 'divide' then '/'
end

prompt("#{number1} #{sign} #{number2} = #{result}")