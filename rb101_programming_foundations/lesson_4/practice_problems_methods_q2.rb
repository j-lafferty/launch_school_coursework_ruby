# Practice Problem 2
# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
# returns number of elements for which the block returns a true value
# returns number of elements that are less than 4 characters
# returns 2