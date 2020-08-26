# You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

# returns a different string object.
# String#split converts the string object into an Array object
def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

str = 'hello world'
puts str.object_id # 47435609148580
puts spin_me(str).object_id # 47435609148360
