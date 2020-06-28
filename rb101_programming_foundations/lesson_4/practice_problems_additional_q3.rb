# Practice Problem 3
# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# remove people with age 100 and greater.

greater_ages = ages.select {|k, v| v >= 100}