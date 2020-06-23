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

