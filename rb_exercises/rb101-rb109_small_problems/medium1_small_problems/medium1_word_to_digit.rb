# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

ALPHA_DIGITS = %w(zero one two three four five six seven eight nine)
NUM_DIGITS = [*0..9]
DIGITS = ALPHA_DIGITS.zip(NUM_DIGITS).to_h

def word_to_digit(str)
  result = []

  str.split.each do |i|
    punct = i.slice!(-1) if i[-1].match?(/[[:punct:]]/)
    word = DIGITS.has_key?(i) ? DIGITS[i].to_s : i

    word += punct if punct != nil
    result << word
  end
  
  result.join(' ')
end

# Example:

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'