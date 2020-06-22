=begin 
The following array contains three names and numbers. Group each name with the number following it by placing the pair in their own array. Then create a nested array containing all three groups. What does this look like? (You don't need to write any code here. Just alter the value shown so it meets the exercise requirements.)

['Dave', 7, 'Miranda', 3, 'Jason', 11]
=end
arr = ['Dave', 7, 'Miranda', 3, 'Jason', 11]
new_arr = []

while arr.count > 0 do
  new_arr << arr.shift(2)
end


p new_arr
=begin 
In the code below, a nested array containing three groups of names and numbers is assigned to favorites.

favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
Use Array#flatten to flatten favorites so that it's no longer a nested array. Then assign the flattened array to a variable named flat_favorites and print its value using #p.
=end
favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
favorites.flatten!

p favorites