# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

def palindrome?(str)
  str == str.reverse
end

def arr_palindrome?(arr)
  arr == arr.reverse
end

# Examples:
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('madam') == true
puts palindrome?('356653') == true

# Examples:
puts arr_palindrome?(%w(Madam Sir cat dog)) == false          
puts arr_palindrome?(%w(Madam cat dog cat madam)) == false # (case matters)
puts arr_palindrome?(%w(Madam Sir cat dog cat Sir Madam)) == true
puts arr_palindrome?([1, 2, 3, 4, 3, 2, 1]) == true
puts arr_palindrome?([1]) == true