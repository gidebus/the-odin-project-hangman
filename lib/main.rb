# frozen_string_literal: true

require_relative './reader'
require_relative './selector'
require_relative './collector'
require_relative './parser'
require_relative './turn'
require_relative './word_manager'

reader = Reader.new
selector = Selector.new
parser = Parser.new
collector = Collector.new
turn = Turn.new


txt = reader.read

words = parser.parse(txt)
words = collector.collect(words)
word = selector.select(words)

manager = WordManager.new(word)
  
def take_a_guess
  print 'guess: '
  guess = gets.chomp.downcase
  return guess
end

while manager.is_word_unsolved?
  puts ''
  puts "guesses: #{manager.wrong_guesses} word: #{manager.board.join}  turn: #{turn.turn}"
  guess = take_a_guess
  if manager.is_guess_in_word?(guess)
    manager.update_board(guess)
  end
  manager.add_guess(guess)
  turn.increment_turn
end
