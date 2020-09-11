# We wrote a neutralize method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?

def neutralize(sentence)
  words = sentence.split(' ')

  # mutating array causes items to shift while iterating.
  # this can be avoided by assigning the changes to a new array, 
  # and leaving the original array intact.
  new_sentence = words.select { |word| word unless negative?(word) }
  
  new_sentence.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.