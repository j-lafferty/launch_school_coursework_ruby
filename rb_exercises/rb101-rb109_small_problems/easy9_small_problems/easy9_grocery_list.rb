# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

def buy_fruit(arr)
  list = []

  arr.each do |i|
    n = i[1]
    until n == 0
      list << i[0]
      n -= 1
    end
  end
  list.flatten
end

# Example:

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]