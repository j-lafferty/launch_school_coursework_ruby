# Build a program that displays when the user will retire and how many years she has to work till retirement.

require 'date'

CURRENT_YEAR = Date.today.year

def msg(str)
  puts "=> #{str}"
end

def years_to_work(age, age_to_retire)
  age_to_retire - age
end

def retirement_year(current_year, age_to_retire)
  current_year + age_to_retire
end

def display(age, age_to_retire, current_year)
  working_years = years_to_work(age, age_to_retire)
  year_of_retirement = retirement_year(current_year, age_to_retire)

  msg("It's #{current_year}. You will retire in #{year_of_retirement}.")
  msg("You have only #{working_years} years of work to go!")
end

msg("What is your age?")
age = gets.chomp.to_i

msg("At what age would you like to retire?")
age_to_retire = gets.chomp.to_i

display(age, age_to_retire, CURRENT_YEAR)

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!