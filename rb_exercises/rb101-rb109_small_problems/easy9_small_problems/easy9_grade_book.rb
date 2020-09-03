# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

# Numerical Score Letter	Grade
# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'
# Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

LETTER_GRADE = {
  'A': [*90..100],
  'B': [*80..89],
  'C': [*70..79],
  'D': [*60..69],
  'F': [*0..59]
}

def grade_average(num1, num2, num3)
  scores = [num1, num2, num3]
  (scores.sum / scores.size).round
end

def get_grade(num1, num2, num3)
  avg = grade_average(num1, num2, num3)
  LETTER_GRADE.find { |k, v| k if v.include?(avg) }.first.to_s
end

# Example:

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"