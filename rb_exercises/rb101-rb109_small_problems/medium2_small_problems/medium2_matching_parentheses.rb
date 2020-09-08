# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

def balanced?(str)
  open_paren = (0...str.size).find_all { |i| str[i] == '(' }
  close_paren = (0...str.size).find_all { |i| str[i] == ')' }

  return true if open_paren.size == 0 && close_paren.size == 0

  result = false

  if open_paren.size == close_paren.size 
    open_paren.each_with_index do |v, i| 
      v < close_paren[i] ? result = true : result = false
    end
  end

  result
end

# Examples:

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
# Note that balanced pairs must each start with a (, not a ).