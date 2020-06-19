=begin
Write a loop that prints numbers 1-5 and whether the number is even or odd. Use the code below to get started.

count = 1

loop do
  count += 1
end
=end

count = 1

loop do
  puts count.odd? ? "#{count} is odd!" : "#{count} is even!"
  break if count == 5
    count += 1
end

=begin
Modify the following code so that the loop stops if number is equal to or between 0 and 10.

loop do
  number = rand(100)
  puts number
end
=end
loop do
  number = rand(100)
  puts number
  break if number.between?(0, 10)
end

=begin
Using an if/else statement, run a loop that prints "The loop was processed!" one time if process_the_loop equals true. Print "The loop wasn't processed!" if process_the_loop equals false.

process_the_loop = [true, false].sample
=end
process_the_loop = [true, false].sample

print process_the_loop ? "The loop was processed!" : "The loop wasn't processed!"

=begin
The code below asks the user "What does 2 + 2 equal?" and uses #gets to retrieve the user's answer. Modify the code so "That's correct!" is printed and the loop stops when the user's answer equals 4. Print "Wrong answer. Try again!" if the user's answer doesn't equal 4.

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
end
=end
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts "That's correct!"
    break
  end
  puts "Wrong answer. Try again!"
end

=begin
Modify the code below so that the user's input gets added to the numbers array. Stop the loop when the array contains 5 numbers.

numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
end
puts numbers
=end
numbers = []
loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers << input
  break if number.count == 5
end
puts numbers


