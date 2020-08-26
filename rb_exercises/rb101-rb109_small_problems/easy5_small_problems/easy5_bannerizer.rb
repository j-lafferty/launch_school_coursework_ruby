# Write a method that will take a short line of text, and print it within a box.

def box_dash(str)
  dashes = ''
  str.size.times { |i| dashes << '-' }
  dashes
end

def box_space(str)
  spaces = ''
  str.size.times { |i| spaces << ' ' }
  spaces
end

def truncate?(str)
  str.size > 78 ? str[0..75] << str[76..-1].replace('...') : str
end

def print_in_box(str)
  str = truncate?(str)

  puts "+-#{box_dash(str)}-+"
  puts "| #{box_space(str)} |"
  puts "| #{str} |"
  puts "| #{box_space(str)} |"
  puts "+-#{box_dash(str)}-+"
end

# Example:

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('To boldly go where no one has gone before, except for that person, and that other person.')
# +---------------------------------------------------------------------------------+
# |                                                                                 |
# | To boldly go where no one has gone before, except for that person, and that ... |
# |                                                                                 |
# +---------------------------------------------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
# You may assume that the input will always fit in your terminal window.