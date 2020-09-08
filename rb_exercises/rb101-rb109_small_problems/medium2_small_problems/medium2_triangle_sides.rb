# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

def valid_triangle?(sides, max, min)
  min <= 0 || (sides.sum - max) < max ? false : true
end

def equilateral?(sides, max)
  sides.all?(max)
end

def isosceles?(sides, max, min)
  sides.select { |i| i == max }.size == 2 ||
  sides.select { |i| i == min }.size == 2
end

def scalene?(sides)
  sides == sides.uniq
end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  max = sides.max
  min = sides.min

  return :invalid if !valid_triangle?(sides, max, min)
  return :equilateral if equilateral?(sides, max)
  return :isosceles if isosceles?(sides, max, min)
  return :scalene if scalene?(sides)
end

# Examples:

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid