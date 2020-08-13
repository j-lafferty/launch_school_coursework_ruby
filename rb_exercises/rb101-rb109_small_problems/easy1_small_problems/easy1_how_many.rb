# Write a method that counts the number of occurrences of each element in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'Car', 'truck'
]

# count_occurrences(vehicles)
# The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted, print each element alongside the number of occurrences.

# Expected output:

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

def count_occurrences(arr)
  occurrences = {}
  arr_downcase = arr.map {|i| i.downcase} # case insensitive

  arr_downcase.uniq.each do |i|
    occurrences[i] = arr_downcase.count(i)
  end
  
  occurrences.each { |item, num| puts "#{item} => #{num}"}
end

count_occurrences(vehicles)