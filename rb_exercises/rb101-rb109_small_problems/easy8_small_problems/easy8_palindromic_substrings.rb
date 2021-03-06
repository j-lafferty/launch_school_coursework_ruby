# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

def leading_substrings(str, c)
  (1..str.length - c).map { |i| str[c, i] }
end

def substrings(str)
  (0..str.length - 1).map { |c| leading_substrings(str, c) }.flatten
end

def palindromes(str)
  substrings(str).select { |v| v if v.length > 1 && v == v.reverse }
end

# further exploration
# Can you modify this method (and/or its predecessors) to ignore non-alphanumeric characters and case? Alphanumeric characters are alphabetic characters(upper and lowercase) and digits.

def palindromes_alnum_only(str)
  substrings(str).select { |v| v if (v.length > 1) &&
                                    (v.downcase == v.downcase.reverse) unless
                                    v.match?(/\p{^Alnum}/) }
end

# Examples:

puts "Palindroms"
puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Examples:

puts "Alphanumeric Palindroms Only"
puts palindromes_alnum_only('abcd') == []
puts palindromes_alnum_only('madam') == ['madam', 'ada']
puts palindromes_alnum_only('hello-madam-did-madam-goodbye-Madam-') == [
  'll', 'madam', 'ada', 'did', 'madam', 'ada', 'oo', 'Madam', 'ada'
]
puts palindromes_alnum_only('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]