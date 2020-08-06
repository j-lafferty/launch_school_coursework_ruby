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

DECK = {
    hearts: %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace), 
    diamonds: %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace), 
    spades: %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace), 
    clubs: %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
}

player_cards = []
dealer_cards = []

def prompt(msg)
    puts "=> #{msg}"
end

def draw_card(cards, deck)
    card_suit = deck.to_a.sample
    card_value = card_suit[1].sample

    card_drawn = [card_suit[0], card_value]
    cards << card_drawn
end

def card_drawn_msg(str, cards)
    prompt "#{str} drew: #{cards.last[1]} of #{cards.last[0].to_s.capitalize}"
    case str
    when 'Player' then prompt "#{str} has: #{total(cards)}."
    when 'Dealer' then prompt "#{str} has: #{total(cards)} and an unknown card."
    end
    puts ""
end

def total(cards)
    values = cards.map { |card| card[1] }

    sum = 0
    values.each do |value|
        if value == 'Ace'
            sum += 11
        elsif value.to_i == 0 # for face value cards
            sum += 10
        else
            sum += value.to_i
        end
    end

    # set Ace to equal 1 if bust when Ace set to 11
    values.select { |value| value == 'Ace' }.count.times do
        sum -= 10 if sum > 21
    end
    
    sum
end

def busted?(cards)
    total(cards) > 21
end

def player_play(player, deck)
    puts ""
    loop do
        prompt "Hit or Stay?"
        answer = gets.chomp.downcase
        puts ""

        draw_card(player, deck) if answer == 'hit'

        break if answer == 'stay' || busted?(player)

        prompt "Player chose hit!"
        card_drawn_msg('Player', player)
    end
    
    if busted?(player)
        prompt "Player chose hit!"
        card_drawn_msg('Player', player)
        prompt "Player bust!"
        prompt "Dealer wins!"
    else
        prompt "Player chose stay!"
        puts ""
    end
end

def dealer_play(dealer, deck)
    prompt "Dealer has: #{dealer[1][1]} and an unknown card."
    puts ""
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
        puts ""
    end
end

def deal_first_cards(player, dealer, deck)
    puts ""
    2.times { draw_card(player, deck) }
    prompt "Player has: #{player[0][1]} and #{player[1][1]}. Total of #{total(player)}."
    
    2.times { draw_card(dealer, deck) }
    prompt "Dealer has: #{dealer[1][1]} and an unknown card."
end

def winner?(player, dealer)
    prompt "Player has: #{total(player)}; Dealer has: #{total(dealer)}"
    if total(player) > total(dealer)
        'Player'
    elsif total(player) < total(dealer)
        'Dealer'
    elsif total(player) == total(dealer)
        'Draw'
    end
end

def display_winner(winner, player, dealer)
    case winner
    when 'Player' then prompt "Player wins with #{total(player)}!"
    when 'Dealer' then prompt "Dealer wins with #{total(dealer)}!"
    when 'Draw' then prompt "It's a draw!"
    end
end

def clear_game(player, dealer)
    player.clear
    dealer.clear
end

def game_play(player, dealer, deck)
    loop do
        loop do
            clear_game(player, dealer)
            deal_first_cards(player, dealer, deck)
            break if player == 21 || dealer == 21

            player_play(player, deck)
            break if busted?(player)

            dealer_play(dealer, deck)
            break if busted?(dealer)

            winner = winner?(player, dealer)
            display_winner(winner, player, dealer)
            break
        end

        puts ""
        prompt "Would you like to play again? (Y or N)"
        answer = gets.chomp.downcase

        break if answer == 'n'
    end
end

game_play(player_cards, dealer_cards, DECK)
