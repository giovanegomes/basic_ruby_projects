# Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary)
# as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string
# and how many times it was found.
#
# https://www.theodinproject.com/lessons/ruby-sub-strings

def substrings(text, dictionary)
  words_included = text.split(/\W+/).map do |word|
    dictionary.select { |item| item if word.downcase.include?(item) }
  end

  result = words_included.flatten.reduce(Hash.new(0)) do |acc, occurrence|
    acc[occurrence] += 1
    acc
  end

  p result
end

substrings("Howdy partner, sit down! How's it going?", ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"])