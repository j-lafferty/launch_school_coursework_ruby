# Practice Problem 1
# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end 
# returns original array because block's return value ('hi') is thruthy