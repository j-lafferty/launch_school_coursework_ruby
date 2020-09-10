# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

require 'date'

def friday_13th(year)
  (1..12).count { |month| Time.new(year, month, 13).friday? }
end

# Further Exploration
# An interesting variation on this problem is to count the number months that have five Fridays. This one is harder than it sounds since you must account for leap years.

def months_with_5_fridays(year)
  result = Hash.new(0)
  start_date = Date.new(year, 1, 1)
  end_date = start_date.next_year - 1
  friday = [5]

  selection = (start_date..end_date).to_a.select { |i| friday.include?(i.wday) }
  selection.map! { |date| date.month }
          #  .map! { |month| Date::MONTHNAMES[month] } # if month names are wanted
           .each { |month| result[month] += 1 }

  result.select { |_k, v| v == 5 }.size
end

# Examples:

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2

puts "Furthur Exploration"
puts months_with_5_fridays(2015) == 4
puts months_with_5_fridays(2016) == 5
puts months_with_5_fridays(1986) == 4
puts months_with_5_fridays(2019) == 4
