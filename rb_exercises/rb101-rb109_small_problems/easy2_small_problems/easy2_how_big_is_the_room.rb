# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

SQMETERS_TO_SQFEET = 10.7639

def square_meter(len, wid)
  len * wid
end

def squre_feet(sq_meter, to_sqfeet)
  (sq_meter * to_sqfeet).round(2)
end

puts "Enter the length of the room in meters: "
room_length = gets.chomp.to_f

puts "Enter the width of the room in meters: "
room_width = gets.chomp.to_f

sq_meter = square_meter(room_length, room_width)
sq_feet = squre_feet(sq_meter, SQMETERS_TO_SQFEET)

puts "The area of the room is #{sq_meter} square meters (#{sq_feet} square feet)."

# Example Run
# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).