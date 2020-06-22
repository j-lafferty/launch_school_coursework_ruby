# ask the user for two numbers
# ask the user for an operation to perform
# peform the operation on the two number
# output the results

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
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
  prompt("----------------")
  prompt("")
  prompt("Would you like to perform another calculation?")
  prompt("Press 'Y' to calculate again.")
  prompt("Press 'N' to cancle.")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for using the Calculator!")