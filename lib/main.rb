# frozen_string_literal: true

require_relative './reader'
require_relative './selector'
require_relative './collector'
require_relative './parser'
require_relative './turn'
require_relative './board'

reader = Reader.new
selector = Selector.new
parser = Parser.new
collector = Collector.new
turn = Turn.new

txt = reader.read

words = parser.parse(txt)
words = collector.collect(words)
word = selector.select(words)

board = Board.new(word)
  
def take_a_guess
  print 'guess: '
  guess = gets.chomp.downcase
  return guess
end

def errored_out?
  board.errors != 7
end

def game_over?
  errored_out? && board.is_word_unsolved?
end

while board.is_word_unsolved?
  puts ''
  puts "guesses: #{board.wrong_guesses} word: #{board.board.join}  turn: #{turn.turn} errors: #{board.errors}/7"
  guess = take_a_guess
  if board.is_guess_in_word?(guess)
    board.update_board(guess)
  end
  board.add_guess(guess)
  turn.increment_turn
end
