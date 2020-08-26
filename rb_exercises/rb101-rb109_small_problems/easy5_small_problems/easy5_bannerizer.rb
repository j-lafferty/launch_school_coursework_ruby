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

def print_in_box(str)
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

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
# You may assume that the input will always fit in your terminal window.