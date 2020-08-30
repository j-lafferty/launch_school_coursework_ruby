# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

# non-letter characters are ignored by #upcase and #downcase
def swapcase(str)
  str.chars.map { |i| i.match?(/\p{Ll}/) ? i.upcase : i.downcase}.join
end

# Example:

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
