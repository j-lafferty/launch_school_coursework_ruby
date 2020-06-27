# Practice Problem 9
# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
# map returns a new array with the results of running block once for every element in enum.
# this code would return an array of values greater than 3 characters
# if statement returns nil for conditions that are false
# => [nil, 'bear']