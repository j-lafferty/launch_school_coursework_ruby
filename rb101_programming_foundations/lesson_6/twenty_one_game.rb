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

player = []
dealer = []

def integer?(num)
    num.to_i.to_s == num
end
