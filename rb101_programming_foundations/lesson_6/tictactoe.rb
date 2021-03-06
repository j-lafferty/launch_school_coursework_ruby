require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagnals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
FIRST_MOVE_VALID_CHOICES = %w(player computer)
VALID_INPUT = {
  player: ['player', 'p', 'pla', 'play'],
  computer: ['computer', 'c', 'comp']
}

first_move = 'choose'

scores = {
  player: 0,
  computer: 0
}

def prompt(msg)
  puts "=> #{msg}"
end

# standardizes user input to match FIRST_MOVE_VALID_CHOICES
def standardize_input(input)
  VALID_INPUT.find { |_, v| v.include?(input) }.first.to_s
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}; Computer is a #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialise_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  # binding.pry
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def player_places_piece(brd)
  square = ''
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i

    break if empty_squares(brd).include?(square)

    prompt "Sorry, that's not a valid choice."
  end
  # binding.pry
  brd[square] = PLAYER_MARKER
end

def computer_defense(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select{ |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def computer_places_piece(brd)
  square = nil

  # pick winning move
  WINNING_LINES.each do |line|
    square = computer_defense(line, brd, COMPUTER_MARKER)
    break if square
  end

  # pick defensive move
  if !square
    WINNING_LINES.each do |line|
      square = computer_defense(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # pick middle square if available
  if !square
    square = 5 if brd[5] == INITIAL_MARKER
  end

  # pick random square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # binding.pry
    # if brd[line[0]] == PLAYER_MARKER &&
    #    brd[line[1]] == PLAYER_MARKER &&
    #    brd[line[2]] == PLAYER_MARKER
    #   return 'Player'
    # elsif brd[line[0]] == COMPUTER_MARKER &&
    #       brd[line[1]] == COMPUTER_MARKER &&
    #       brd[line[2]] == COMPUTER_MARKER
    #   return 'Computer'
    # end
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

# update player and computer score
def update_score(brd, scores)
  scores[:player] += 1 if detect_winner(brd) == 'Player'
  scores[:computer] += 1  if detect_winner(brd) == 'Computer'
end

def player_first(board)
  loop do
    display_board(board)

    player_places_piece(board)
    break if someone_won?(board) || board_full?(board)

    display_board(board)
    computer_places_piece(board)

    # binding.pry
    break if someone_won?(board) || board_full?(board)
  end
end

def computer_first(board)
  loop do
    display_board(board)

    computer_places_piece(board)
    break if someone_won?(board) || board_full?(board)

    display_board(board)
    player_places_piece(board)

    # binding.pry
    break if someone_won?(board) || board_full?(board)
  end
end

def game(starter, board)
  case starter
  when 'player' then player_first(board)
  when 'computer' then computer_first(board)
  end
end

loop do
  board = initialise_board

  while true do
    prompt "Who goes first? (player or computer)"
    first_move = gets.chomp.downcase
    first_move = standardize_input(first_move)

    break if FIRST_MOVE_VALID_CHOICES.include?(first_move)

    prompt "Sorry, that's not a valid choice."
  end

  game(first_move, board)

  display_board(board)

  if someone_won?(board)
    update_score(board, scores)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt("")
  prompt("Player score: #{scores[:player]}; Computer score: #{scores[:computer]}")
  prompt("")
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good Bye!"
