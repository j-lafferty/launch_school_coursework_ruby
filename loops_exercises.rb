=begin
Using a while loop, print 5 random numbers between 0 and 99. The code below shows an example of how to begin solving this exercise.

numbers = []

while <condition>
  # ...
end
=end

numbers = []

while numbers.length < 5
  numbers << rand(99)
  # ...
end
p numbers

=begin
The following code outputs a countdown from 10 to 1. Modify the code so that it counts from 1 to 10 instead.

count = 10

until count == 0
  puts count
  count -= 1
end
=end
count = 1

until count > 10
  puts count
  count += 1
end
