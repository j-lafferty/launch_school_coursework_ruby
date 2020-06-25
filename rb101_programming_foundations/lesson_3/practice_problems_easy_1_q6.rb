=begin
Question 6
Starting with the string:

famous_words = "seven years ago..."
show two different ways to put the expected "Four score and " in front of it.
=end

famous_words = "seven years ago..."

famous_words.prepend("Four score and ")
famous_words.insert(0, "Four score and ")
"Four score and " << famous_words