=begin 

>You'll need three pieces of information:

>>the loan amount
>>the Annual Percentage Rate (APR)
>>the loan duration

>From the above, you'll need to calculate the following things:

>>monthly interest rate
>>loan duration in months
>>monthly payment

m = p * (j / (1 - (1 + j)**(-n)))
m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months

Hints:

>Figure out what format your inputs need to be in. For example, should the interest rate be expressed as 5 or .05, if you mean 5% interest?
>If you're working with Annual Percentage Rate (APR), you'll need to convert that to a monthly interest rate.
>Be careful about the loan duration -- are you working with months or years? >
>Choose variable names carefully to assist in remembering.

=end
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

loan_amount = ''
apr = ''
loan_duration = ''

monthly_interest_rate = apr / 12
loan_duration_in_months = loan_duration / 12

prompt("Welcome to the Loan Calculator!")
prompt("Follow the prompts to find your monthly payments")
prompt("------------------------------------------------")
prompt("")

loop do
  loop do
    prompt("Please enter the loan amount:")
    loan_amount = gets.chomp

    break if valid_number?(loan_amount)
    prompt("Hmm... that doesn't look like a valid number.")
  end

  loan_amount = to_float_or_to_integer?(loan_amount)

  loop do
    prompt("Please enter your Annual Percentage Rate (APR):")
    apr = gets.chomp

    break if valid_number?(apr)
    prompt("Hmm... that doesn't look like a valid number.")
  end

  apr = to_float_or_to_integer?(apr)

  loop do
    prompt("Please enter the loan duration in years:")
    loan_duration = gets.chomp

    break if valid_number?(loan_duration)
    prompt("Hmm... that doesn't look like a valid number.")
  end

  loan_duration = to_float_or_to_integer?(loan_duration)
  
end






