# We wrote a method for moving a given number of elements from one array to another. We decide to test it on our todo list, but invoking move on line 11 results in a SystemStackError. What does this error mean and why does it happen?

# Further Exploration
# What happens if the length of the from_array is smaller than n?
# -- if from_array is smaller than n, then nil will be added appended to to_array

def move(n, from_array, to_array)
  # need condition to terminate recursion
  return if n == 0 || from_array.empty?
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

# move(2, todo, done)
move(3, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']