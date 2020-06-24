=begin
In this assignment, we'll build a Rock Paper Scissors game.
The game flow should go like this:

the user makes a choice
the computer makes a choice
the winner is displayed
=end

VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts("=> #{message}")
end

def player_wins?(player, computer)
  return true if
    (player == VALID_CHOICES[0] && computer == VALID_CHOICES[2]) ||
    (player == VALID_CHOICES[1] && computer == VALID_CHOICES[0]) ||
    (player == VALID_CHOICES[2] && computer == VALID_CHOICES[1])
end

def computer_wins?(player, computer)
  return true if
    (player == VALID_CHOICES[0] && computer == VALID_CHOICES[1]) ||
    (player == VALID_CHOICES[1] && computer == VALID_CHOICES[2]) ||
    (player == VALID_CHOICES[2] && computer == VALID_CHOICES[0])
end

def round(choice, computer_choice)
  if player_wins?(choice, computer_choice)
    prompt("You win!")
  elsif computer_wins?(choice, computer_choice)
    prompt("Computer wins!")
  else
    prompt("It's a tie!")
  end
end

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
