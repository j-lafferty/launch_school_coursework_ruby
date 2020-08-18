# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

user_numbers = []

def msg(str)
  puts "=> #{str}"
end

def input_check(user_numbers)
  if user_numbers.first(user_numbers.length - 1)
                 .include?(user_numbers.last)
    rejected = user_numbers.pop
    reject_input(user_numbers, rejected)
  else
    accept_input(user_numbers)
  end
end

def number_suffix(num)
  case num
  when 1 then "#{num}st"
  when 2 then "#{num}nd"
  when 3 then "#{num}rd"
  when 4..5 then "#{num}th"
  when 6 then "last"
  end
end

def ask(num, user_numbers)
  puts "Enter the #{number_suffix(num)} number :"
  input = gets.chomp.to_i
  user_numbers << input
  input_check(user_numbers) if num == 6
end

def reject_input(user_numbers, rejected)
  msg("The number #{rejected} appears in #{user_numbers}.")
end

def accept_input(user_numbers)
  msg("The number #{user_numbers.last} does not appear in #{user_numbers}.")
end

1.upto(6) { |i| ask(i, user_numbers)}



# Examples:

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].