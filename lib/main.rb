# frozen_string_literal: true

require_relative './reader'
require_relative './selector'
require_relative './collector'
require_relative './parser'

reader = Reader.new
selector = Selector.new
parser = Parser.new
collector = Collector.new

txt = reader.read

words = parser.parse(txt)
words = collector.collect(words)
word = selector.select(words)


word_size = word.length
word = word.split('')
fake_word =  Array.new(word_size, '.')
  
def take_a_guess
  puts 'guess:'
  guess = gets.chomp
  return guess
end

  # if word.include?(guess)
  #   word.each_with_index do |char, index|
  #     if char == guess
  #       fake_word[index] = char
  #     end
  #   end
  #   p fake_word
  # end

while true
  if fake_word.include?('.')
    guess = take_a_guess
    if word.include?(guess)
      word.each_with_index do |char, index|
        if char == guess
          fake_word[index] = char
        end
      end
    end
  else
    break
  end
  p word
  p fake_word
end