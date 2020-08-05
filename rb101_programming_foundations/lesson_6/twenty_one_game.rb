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

def draw_card(deck)
    deck.to_a.sample
end

def card_drawn_msg(str, cards)
    puts "#{str} drew #{cards.last[1]} of #{cards.last[0].to_s.capitalize}"
    puts "#{str} has #{total(cards)}."
    puts ""
end

def total(cards)
    values = cards.map { |card| card[1] }

    sum = 0
    values.each do |value|
        if value == 'A'
            sum += 11
        elsif value.to_i == 0 # for face value cards
            sum += 10
        else
            sum += value.to_i
        end
    end

    # set Ace to equal 1 if bust when Ace set to 11
    values.select { |value| value == 'A' }.count.times do
        sum -= 10 if sum > 21
    end
    
    sum
end

def busted?(cards, deck)
    cards << draw_card(deck)
    total(cards) > 21
end

def player_play
    loop do
        puts "Hit or Stay?"
        answer = gets.chomp
        
        break if answer == "Stay" || busted?(player_cards, DECK)

        puts "You chose hit!"
        card_drawn_msg('Player', player_cards)
    end
    
    if busted?
        card_drawn_msg('Player', player_cards) 
        puts "You bust!"
    else
        puts "You chose stay!"
    end
end
