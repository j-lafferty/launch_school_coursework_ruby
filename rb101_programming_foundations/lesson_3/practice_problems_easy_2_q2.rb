=begin
Question 2
Starting with this string:

munsters_description = "The Munsters are creepy in a good way."
Convert the string in the following ways (code will be executed on original munsters_description above):

"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
=end
munsters_description = "The Munsters are creepy in a good way."

# output "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.swapcase!
p munsters_description

# output "The munsters are creepy in a good way."
munsters_description.capitalize!
p munsters_description

# output "the munsters are creepy in a good way."
munsters_description.downcase!
p munsters_description

# output "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.upcase!
p munsters_description