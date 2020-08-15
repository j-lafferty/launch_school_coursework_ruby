# Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

def msg(str)
  puts "=> #{str}"
end

def greet(name)
  standard_greet = "Hello #{name}."
  yell_greet = "HELLO #{name.chop.upcase}. "\
               "WHY ARE WE SCREAMING?"

  name.end_with?("!") ? msg(yell_greet) : msg(standard_greet)
end

msg("What is your name?")
name = gets.chomp

greet(name)

# Examples

# What is your name? Bob
# Hello Bob.
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?