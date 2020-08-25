# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

def letter_swap(word, first, last)
  first == nil ? last : last.concat(word, first)
end

def swap(str)
  words = str.split(' ')
  result = []

  words.each do |word|
    last = word.slice!(word.length - 1)
    first = word.slice!(0)

    result << letter_swap(word, first, last)
  end

  result.join(' ')
end

# Examples:
puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'