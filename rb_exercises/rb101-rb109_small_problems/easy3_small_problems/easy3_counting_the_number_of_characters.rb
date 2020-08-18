# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

def msg(str)
  puts "=> #{str}"
end

def char_count(str)
  str.delete(' ').length
end

def display(str)
  msg("There are #{char_count(str)} characters in \"#{str}\".")
end

msg("Please write a word or multiple words: ")
str = gets.chomp

display(str)

# input:

# Please write word or multiple words: walk
# output:

# There are 4 characters in "walk".
# input:

# Please write word or multiple words: walk, don't run
# output:

# There are 13 characters in "walk, don't run".