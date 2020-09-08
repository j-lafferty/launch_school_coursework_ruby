# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

def letter_percentages(str)
  percentages = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }
  count = Hash.new(0)

  str.chars.each do |i|
    case
    when i.match?(/\p{Ll}/) then count[:lowercase] += 1
    when i.match?(/\p{Lu}/) then count[:uppercase] += 1
    else count[:neither] += 1
    end
  end

  count.each { |k, v| percentages[k] = (v / str.size.to_f * 100).round(2) }
  
  percentages
end

# Examples

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }