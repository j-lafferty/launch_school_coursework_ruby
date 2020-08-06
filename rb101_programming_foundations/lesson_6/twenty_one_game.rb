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

def draw_card(cards, deck)
    card_suit = deck.to_a.sample
    card_value = card_suit[1].sample

    card_drawn = [card_suit[0], card_value]
    cards << card_drawn
end

def card_drawn_msg(str, cards)
    puts "#{str} drew: #{cards.last[1]} of #{cards.last[0].to_s.capitalize}"
    case str
    when 'Player' then puts "#{str} has: #{total(cards)}."
    when 'Dealer' then puts "#{str} has: #{total(cards)} and an unknown card."
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
        puts "Hit or Stay?"
        answer = gets.chomp.downcase
        puts ""

        draw_card(player, deck) if answer == 'hit'

        break if answer == 'stay' || busted?(player)

        puts "Player chose hit!"
        card_drawn_msg('Player', player)
    end
    
    if busted?(player)
        puts "Player chose hit!"
        card_drawn_msg('Player', player)
        puts "Player bust!"
        puts "Dealer wins!"
        puts ""
    else
        puts "Player chose stay!"
        puts ""
    end
end

def dealer_play(dealer, deck)
    puts "Dealer has: #{dealer[1][1]} and an unknown card."
    puts ""
    loop do
        break if total(dealer) >= 17 || busted?(dealer)

        draw_card(dealer, deck)

        puts "Dealer chose hit!"
        card_drawn_msg('Dealer', dealer[1, (dealer.length - 1)])
    end
    
    if busted?(dealer)
        puts "Dealer has: #{total(dealer)}."
        puts "Dealer bust!"
        puts "Player wins!"
        puts ""
    else
        puts "Dealer chose stay!"
        puts ""
    end
end

def deal_first_cards(player, dealer, deck)
    puts ""
    2.times { draw_card(player, deck) }
    puts "Player has: #{player[0][1]} and #{player[1][1]}. Total of #{total(player)}."
    
    2.times { draw_card(dealer, deck) }
    puts "Dealer has: #{dealer[1][1]} and an unknown card."
end

def winner?(player, dealer)
    puts "Player has: #{total(player)}; Dealer has: #{total(dealer)}"
    if total(player) > total(dealer)
        puts "Player wins with #{total(player)}!"
        puts ""
    elsif total(player) < total(dealer)
        puts "Dealer wins with #{total(dealer)}!"
        puts ""
    elsif total(player) == total(dealer)
        puts "It's a draw!"
        puts ""
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

            winner?(player, dealer)
            break
        end

        puts "Would you like to play again? (Y or N)"
        answer = gets.chomp.downcase

        break if answer == 'n'
    end
end

game_play(player_cards, dealer_cards, DECK)
