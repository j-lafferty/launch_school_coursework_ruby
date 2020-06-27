# Practice Problem 7
# What is the block's return value in the following code? 
# How is it determined? 
# Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
# any? returns a boolean
# since num.odd? is the last statement evaluated, the block returns true
# since the first item in the array is an odd number,
# the loop only executes 1 time