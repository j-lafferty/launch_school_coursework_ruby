# Practice Problem 3
# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end
# returns an array for all elements of enum for which the given block returns false.
# puts always returns nil, which is falsey
# this code returns an array of all elements in original array

