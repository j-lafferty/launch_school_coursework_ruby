# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# first attempt
# def word_sizes(str)
#   count = Hash.new(0)
#   str.split.each do |word|
#     count[word.size] += 1
#   end

#   count
# end

# refactored
def word_sizes(str)
  str.split.map { |word| word.size }.tally
end

# Examples
puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}