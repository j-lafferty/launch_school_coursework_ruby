# Practice Problem 10
# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
# the above code would puts 2 and 3
# map would return [1, nil, nil]