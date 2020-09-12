# Let's build another program using madlibs. We made a program like this in the easy exercises. This time, the requirements are a bit different.

# Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source. Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.

# The challenge of this program isn't about writing your program; it's about choosing how to represent your data. Choose the right way to structure your data, and this problem becomes a whole lot easier. This is why we don't show you what the input data looks like; the input representation is your responsibility.

# Example output:

# The sleepy brown cat noisily
# licks the sleepy yellow
# dog, who lazily licks his
# tail and looks around.

# Example text data

# The %{adjective} brown %{noun} %{adverb}
# %{verb} the %{adjective} yellow
# %{noun}, who %{adverb} %{verb} his
# %{noun} and looks around.

# Example replacement words

# adjectives: quick lazy sleepy ugly
# nouns: fox dog head leg
# verbs: jumps lifts bites licks
# adverb: easily lazily noisily excitedly

require 'pry'

def replacement_word(list, type)
  list[type].sample
end

def madlibs(text, list)
  word_list = list.gsub(/[:]/, '')
                  .split(/\n/)
                  .map { |list| list.split(' ') }
                  .map { |type| [type[0], type[1..-1]] }
                  .to_h
  
  text_arr = text.split(' ')
  
  new_text = text_arr.map do |word|
    case word
    when '%{adjective}'
      replacement_word(word_list, 'adjectives')
    when '%{noun}'
      replacement_word(word_list, 'nouns')
    when '%{adverb}'
      replacement_word(word_list, 'adverbs')
    when '%{verb}'
      replacement_word(word_list, 'verbs')
    else
      word
    end
    # binding.pry
  end
  
  p new_text.join(' ')
end

replacement_word_list = "adjectives: quick lazy sleepy ugly
nouns: fox dog head leg
verbs: jumps lifts bites licks
adverbs: easily lazily noisily excitedly"

text = "The %{adjective} brown %{noun} %{adverb}
%{verb} the %{adjective} yellow
%{noun}, who %{adverb} %{verb} his
%{noun} and looks around."

madlibs(text, replacement_word_list)
