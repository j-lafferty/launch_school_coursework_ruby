# A friend of yours wrote a number guessing game. The first version he shows you picks a random number between 1 and a provided maximum number and offers you a given number of attempts to guess it.

# However, when you try it, you notice that it's not working as expected. Run the code and observe its behavior. Can you figure out what is wrong?

def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break # need to break the loop if guess is correct
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
    end
  end

  puts ''

  # re-call method after game loop so winning number doesn't change with each guess
  # Try again:
  puts 'Try again? (y or n)' # need to indicate a new game
  answer = gets.chomp # need a way to end the game
  guess_number(max_number, max_attempts) if answer == 'y'
end

guess_number(10, 3)
