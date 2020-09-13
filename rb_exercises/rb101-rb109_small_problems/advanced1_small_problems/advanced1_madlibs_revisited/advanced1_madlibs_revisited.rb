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

# require 'pry'

def replacement_word(list, speech_type)
  type = speech_type.gsub(/[<>]/, '')
  list[type].sample
end

def madlibs(text, list)
  replacement_list = list.gsub(/[:]/, '')
                         .split(/\n/)
                         .map { |list| list.split(' ') }
                         .map { |type| [type[0], type[1..-1]] }
                         .to_h
  input_text_arr = text.split(' ')
  
  madlib_text = input_text_arr.map do |word|
    if word[-1].match?(/[,.!?]/)
      punct = word.slice!(-1)
    end
    
    if PARTS_OF_SPEECH.include?(word)
      word = replacement_word(replacement_list, word)
    else
      word
    end

    punct.nil? ? word : word << punct
  end
  
  p madlib_text.join(' ')
end

replacement_word_list = File.open('replacement_word_list.txt').read
text = File.open('input_text.txt').read

PARTS_OF_SPEECH = %w(<adjective> <noun> <adverb> <verb>)

madlibs(text, replacement_word_list)
