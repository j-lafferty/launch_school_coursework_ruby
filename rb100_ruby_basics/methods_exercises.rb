=begin
Write a method named greet that invokes the following methods:

def hello
  'Hello'
end

def world
  'World'
end
When greet is invoked with #puts, it should output the following:

Hello World
Make sure you add a space between "Hello" and "World", however, you're not allowed to modify hello or world.
=end
def hello
  'Hello'
end

def world
  'World'
end

def greet
  "#{hello} #{world}"
end

greet

=begin
Using the following code, write a method called car that takes two arguments and prints a string containing the values of both arguments.

car('Toyota', 'Corolla')
=end
def car(make, model)
  puts "#{make} #{model}"
end

car('Toyota', 'Corolla')

=begin
The variable below will be randomly assigned as true or false. Write a method named time_of_day that, given a boolean as an argument, prints "It's daytime!" if the boolean is true and "It's nighttime!" if it's false. Pass daylight into the method as the argument to determine whether it's day or night.

daylight = [true, false].sample
=end
def time_of_day(x)
  puts x ? "It's daytime!" : "It's nighttime!"
end

daylight = [true, false].sample

time_of_day(daylight)

=begin
Fix the following code so that the names are printed as expected.

def dog
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat}."
=end

def dog(name)
  puts "The dog's name is #{name}"
end

def cat(name)
  puts "The cat's name is #{name}"
end

dog("Spot")
cat("Ginger")

=begin 
Write a method that accepts one argument, but doesn't require it. The parameter should default to the string "Bob" if no argument is given. The method's return value should be the value of the argument.

puts assign_name('Kevin') == 'Kevin'
puts assign_name == 'Bob'
The code should output true twice.
=end
def assign_name(name = 'Bob')
  name
end

 
puts assign_name('Kevin') == 'Kevin'
puts assign_name == 'Bob'

=begin 
Write the following methods so that each output is true.

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36
=end
def add(num1, num2)
  num1 + num2
end

def multiply(x, y)
  x * y
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36

=begin 
The variables below are both assigned to arrays. The first one, names, contains a list of names. The second one, activities, contains a list of activities. Write the methods name and activity so that they each take the appropriate array and return a random value from it. Then write the method sentence that combines both values into a sentence and returns it from the method.

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))
Example output:

George went walking today!
=end
names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(names)
  names.sample
end

def activity(activities)
  activities.sample
end

def sentence(name, activities)
  "#{name} went #{activities} today!"
end

puts sentence(name(names), activity(activities))
