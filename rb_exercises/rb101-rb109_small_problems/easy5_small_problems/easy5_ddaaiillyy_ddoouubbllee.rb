# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

def crunch(str)
  cleaned_str = str.chars
  
  (cleaned_str.size - 1).downto(1) do |i| 
    cleaned_str.delete_at(i) if cleaned_str[i - 1] == cleaned_str[i]
  end
  
  cleaned_str.join
end

# Examples:
puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
