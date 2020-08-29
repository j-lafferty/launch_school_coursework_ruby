# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

# further exploration: any corner, any size
# does not have input validation
def triangle(num, just)
  case just
  when 'left' then 1.upto(num) { |i| puts ('*' * i).ljust(num) }
  when 'right' then 1.upto(num) { |i| puts ('*' * i).rjust(num) }
  end
end

def upside_down_triangle(num, just)
  case just
  when 'left' then num.downto(1) { |i| puts ('*' * i).ljust(num) }
  when 'right' then num.downto(1) { |i| puts ('*' * i).rjust(num) }
  end
end

def triangle_shape?
  puts "Enter height of triangle: "
  num = gets.chomp.to_i
  
  puts "Select corner for triangle point: top-l, top-r, bottom-l, bottom-r"
  corner = gets.chomp

  case corner
  when 'top-l' then triangle(num, 'left')
  when 'top-r' then triangle(num, 'right')
  when 'bottom-l' then upside_down_triangle(num, 'left')
  when 'bottom-r' then upside_down_triangle(num, 'right')
  end
end

# Examples:

triangle_shape?

# triangle(5)

# #     *
# #    **
# #   ***
# #  ****
# # *****
# triangle(9)

# #         *
# #        **
# #       ***
# #      ****
# #     *****
# #    ******
# #   *******
# #  ********
# # *********

# upside_down_triangle(5)
# upside_down_triangle(9)