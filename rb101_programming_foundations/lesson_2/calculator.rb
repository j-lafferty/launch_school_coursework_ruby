# ask the user for two numbers
# ask the user for an operation to perform
# peform the operation on the two number
# output the results

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def to_float_or_to_integer?(num)
  if integer?(num)
    num.to_i
  elsif float?(num)
    num.to_f
  end
end 

def operation_to_message(op)
  case op
  when 'add' then 'Adding'
  when 'subtract' then 'Subtracting'
  when 'multiply' then 'Multiplying'
  when 'divide' then 'Dividing'
  end
end

number1 = ''
number2 = ''
operation = ''

prompt("Welcome to Calculator!")

loop do # main program loop
  loop do
    prompt("Please enter the firt number")
    number1 = gets.chomp

    break if valid_number?(number1)
    prompt("Hmm... that doesn't look like a valid number.")
  end

  loop do
    prompt("Please enter the second number")
    number2 = gets.chomp

    break if valid_number?(number2)
    prompt("Hmm... that doesn't look like a valid number.")
  end

  number1 = to_float_or_to_integer?(number1)
  number2 = to_float_or_to_integer?(number2)

  prompt("What operation would you like to perform on these two numbers?")
  prompt("--Add")
  prompt("--Subtract")
  prompt("--Multiply")
  prompt("--Divide")

  loop do
    operation = gets.chomp.downcase

    break if %w(add subtract multiply divide).include?(operation)
    prompt("Must choose Add, Subtract, Multiply, or Divide")
  end

  prompt("")
  prompt("#{operation_to_message(operation)} the two numbers...")
  prompt("")

  result = case operation
           when 'add' then number1 + number2
           when 'subtract' then number1 - number2
           when 'multiply' then number1 * number2
           when 'divide' then number1 / number2
           end

  sign = case operation
         when 'add' then '+'
         when 'subtract' then '-'
         when 'multiply' then '*'
         when 'divide' then '/'
         end

  prompt("#{number1} #{sign} #{number2} = #{result}")
  prompt("----------------")
  prompt("")
  prompt("Would you like to perform another calculation?")
  prompt("Press 'Y' to calculate again.")
  prompt("Press 'N' to cancle.")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for using the Calculator!")
