# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

ALPHA = ('a'..'z').to_a

def cleanup(str)
  # convert all non-alphabetic characters to ' '
  cleaned_str = str.chars.map { |char| ALPHA.include?(char) ? char : ' ' }

  # convert all duplicate adjacent ' ' to nil
  (cleaned_str.size - 1).downto(1) do |i| 
    cleaned_str[i] = nil if cleaned_str[i - 1] == cleaned_str[i] && \
                                                  cleaned_str[i] == ' '
  end

  # remove all nil values and return a string
  cleaned_str.reject { |i| i == nil }
             .join
end

# Examples:
puts cleanup("---what's my +*& line?") == ' what s my line '