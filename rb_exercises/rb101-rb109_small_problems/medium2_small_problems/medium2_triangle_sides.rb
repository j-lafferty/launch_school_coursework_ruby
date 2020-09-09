# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

def valid_triangle?(*sides)
  sides.min > 0 && sides.sum > 2 * sides.max
end

def nbr_equal_sides(sides)
  4 - sides.uniq.size
end

def triangle_type(*sides)
  case nbr_equal_sides(sides)
  when 3
    :equilateral
  when 2
    :isosceles
  else
    :scalene
  end#.tap { |rv| puts "ret value by #{__method__} = #{rv}" } # for debugging
end

def triangle(side1, side2, side3)
  return :invalid unless valid_triangle?(side1, side2, side3) # guard clause
  triangle_type(side1, side2, side3)
end

# Examples:

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
