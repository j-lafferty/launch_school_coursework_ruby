=begin 
In this assignment, we'll build a Rock Paper Scissors game. The game flow should go like this:

the user makes a choice
the computer makes a choice
the winner is displayed
=end

VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts("=> #{message}")
end

prompt("Choose one: #{VALID_CHOICES.join(', ')}")
choice = gets.chomp

computer_choice = VALID_CHOICES.sample

