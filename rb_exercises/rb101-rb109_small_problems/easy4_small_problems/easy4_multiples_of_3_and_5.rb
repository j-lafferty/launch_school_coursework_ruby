# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

def multiple?(num, divisor)
  num % divisor == 0
end

# initial solution
# def multisum(num)
#   sum = 0
#   1.upto(num) { |i| sum += i if multiple?(i, 3) || multiple?(i, 5) }
#   sum
# end

# refactored solution
def multisum(num)
  (1..num).select { |i| 
                    multiple?(i, 3) || multiple?(i, 5) 
                  }.inject(:+)
end

# Examples
puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168