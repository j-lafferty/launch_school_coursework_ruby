# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(str)
  str.split[-2]
end

# Further Exploration
# Our solution ignored a couple of edge cases because we explicitly stated that you didn't have to handle them: strings that contain just one word, and strings that contain no words.

# Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.

def penultimate_further(str)
  arr = str.split
  case
  when arr.size <= 1 then arr[0]
  else arr.at((arr.size / 2.0).ceil - 1)
  end
end

# Examples:

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'

puts penultimate_further('Launch School is great!') == 'School'
puts penultimate_further('Hello') == 'Hello'
puts penultimate_further('Suppose we need a method') == 'need'