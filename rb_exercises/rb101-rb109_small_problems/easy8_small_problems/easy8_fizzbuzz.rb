# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def fizzbuzz_check(i) 
  case
  when i % 3 == 0 && i % 5 == 0 then 'FizzBuzz'
  when i % 3 == 0 then 'Fizz' 
  when i % 5 == 0 then 'Buzz'
  else i
  end
end

def fizzbuzz(num1, num2)
  puts (num1..num2).map { |i| fizzbuzz_check(i) }.join(', ')
end

# Example:

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz