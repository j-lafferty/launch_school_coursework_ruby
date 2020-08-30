# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

def staggered_case(str)
  # select non-alphabetic characters with their index
  non_alpha = str.chars.each_with_index.select { |c, idx| c.match?(/[^a-z]/i) }

  # strip all non-alphabetic characters
  only_aplha = str.chars.select { |c| c if c.match?(/[a-z]/i) }

  # stagger case
  staggered = only_aplha.each_with_index.map { |c, idx| idx.even? ? c.upcase : c.downcase }

  #insert non-alphabetic character into original index location
  non_alpha.each do |i|
    staggered.insert(i[1], i[0])
  end
  staggered.join
end

# Example:

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'