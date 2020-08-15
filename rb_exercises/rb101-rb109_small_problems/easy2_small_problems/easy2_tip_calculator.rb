# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

def caltulate_tip(bill, tip_percentage)
  (bill * (tip_percentage / 100)).round(2)
end

puts "What is the bill?"
bill = gets.chomp.to_f.round(2)

puts "What is the tip percentage?"
tip_percentage = gets.chomp.to_f.round(2)

tip_amount = caltulate_tip(bill, tip_percentage)

total = bill + tip_amount

puts "The tip is $#{tip_amount}"
puts "The total is $#{total}"

# Example:
# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0
