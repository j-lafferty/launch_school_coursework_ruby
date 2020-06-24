=begin
In this assignment, we'll build a Rock Paper Scissors game.
The game flow should go like this:

the user makes a choice
the computer makes a choice
the winner is displayed
=end

VALID_CHOICES = %w(rock paper scissors lizard spock)

# key wins agains value pairs
WIN_STATES = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['paper', 'spock'],
  spock: ['rock', 'scissors']
}

def prompt(message)
  puts("=> #{message}")
end

# checks if first input beats second input
def win?(first, second)
  WIN_STATES[first.to_sym].include?(second)
end

# game round logic
def round(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
    prompt("Computer wins!")
  else
    prompt("It's a tie!")
  end
end

# main game loop
loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice!")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("")
  prompt("You chose #{choice}; Computer chose #{computer_choice}")

  round(choice, computer_choice)

  prompt("")
  prompt("Play another round?")
  prompt("Type: Yes or No")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("")
prompt("Thank you for playing.")
prompt("Good bye!")
