# Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(str)
  str.chars.map { |i| i * 2 }.join
end

# Examples:

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''