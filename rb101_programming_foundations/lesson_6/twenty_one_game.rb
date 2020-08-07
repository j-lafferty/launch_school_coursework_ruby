# High level psudo-code for Twenty-One game:
# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

DECK_SUITS = %w(hearts diamonds spades clubs)
DECK_VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

def initialize_deck
  DECK_SUITS.product(DECK_VALUES).shuffle
end

def prompt(msg)
  puts "=> #{msg}"
end

def joinand(arr, delimiter=', ', word='and')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def draw_card(cards, deck)
  cards << deck.pop
end

def card_drawn_msg(str, cards)
  prompt "#{str} drew: #{cards.last[1]} of #{cards.last[0].capitalize}"
  case str
  when 'Player' then prompt "#{str} has: #{total(cards)}."
  when 'Dealer' then prompt "#{str} has: #{total(cards)} and an unknown card."
  end
  puts ""
end

def show_hand(cards)
  cards.map { |sub| "#{sub[1]} of #{sub[0].capitalize}" }
end

def card_values?(values)
  sum = 0

  values.each do |value|
    sum += \
      if value == 'Ace'
        11
      elsif value.to_i == 0 # for face value cards
        10
      else
        value.to_i
      end
  end

  # set Ace to equal 1 if bust when Ace set to 11
  values.select { |value| value == 'Ace' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def total(cards)
  values = cards.map { |card| card[1] }

  card_values?(values)
end

def busted?(cards)
  total(cards) > 21
end

def busted_msg(str)
  case str
  when 'Player'
    prompt "Player bust!"
    prompt "Dealer wins!"
  when 'Dealer'
    prompt "Dealer bust!"
    prompt "Player wins!"
  end
end

def player_play(player, deck)
  puts ""
  loop do
    prompt "Hit or Stay?"
    answer = gets.chomp.downcase

    draw_card(player, deck) if answer == 'hit'

    break if answer == 'stay' || busted?(player)

    prompt "Player chose hit!"
    card_drawn_msg('Player', player)
  end

  if busted?(player)
    card_drawn_msg('Player', player)
    busted_msg('Player')
  else
    prompt "Player chose stay!"
  end
end

def dealer_play(dealer, deck)
  puts ""
  prompt "Dealer has: #{dealer[1][1]} and an unknown card."
  loop do
    break if total(dealer) >= 17 || busted?(dealer)

    draw_card(dealer, deck)

    prompt "Dealer chose hit!"
    card_drawn_msg('Dealer', dealer[1, (dealer.length - 1)])
  end

  if busted?(dealer)
    prompt "Dealer has: #{total(dealer)}."
    prompt "Dealer bust!"
    prompt "Player wins!"
  else
    prompt "Dealer chose stay!"
  end
end

def deal_first_cards(player, dealer, deck)
  puts ""
  2.times { draw_card(player, deck) }
  prompt "Player has: #{player[0][1]} and #{player[1][1]}." \
          " Total of #{total(player)}."

  2.times { draw_card(dealer, deck) }
  prompt "Dealer has: #{dealer[1][1]} and an unknown card."
end

def winner?(player, dealer)
  if total(player) > total(dealer)
    'Player'
  elsif total(player) < total(dealer)
    'Dealer'
  elsif total(player) == total(dealer)
    'Draw'
  end
end

def display_winner(winner, player, dealer)
  puts ""
  prompt "Player's hand: #{joinand(show_hand(player))}."
  prompt "Dealer's hand: #{joinand(show_hand(dealer))}."
  puts ""
  prompt "Player has: #{total(player)}; Dealer has: #{total(dealer)}"
  case winner
  when 'Player' then prompt "Player wins with #{total(player)}!"
  when 'Dealer' then prompt "Dealer wins with #{total(dealer)}!"
  when 'Draw' then prompt "It's a draw!"
  end
end

def game_round(player, dealer, deck)
  loop do
    player_play(player, deck)
    break if busted?(player)

    dealer_play(dealer, deck)
    break if busted?(dealer)

    winner = winner?(player, dealer)
    display_winner(winner, player, dealer)
    break
  end
end

def game_play
  loop do
    prompt "Welcome to Twenty-One!"

    # initialize vars
    deck = initialize_deck
    player_cards = []
    dealer_cards = []

    # initial deal
    deal_first_cards(player_cards, dealer_cards, deck)

    game_round(player_cards, dealer_cards, deck)

    puts ""
    prompt "Would you like to play again? (Y or N)"
    answer = gets.chomp.downcase

    break if answer == 'n'
  end
end

game_play
