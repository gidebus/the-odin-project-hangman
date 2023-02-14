# frozen_string_literal: true

class WordManager
  attr_accessor :word, :board
  
  def initialize(word)
    @word = word.split('')
    @board = Array.new(word.length, '.')
  end

  def is_guess_in_word?(char)
    @word.include?(char)
  end

  def is_word_unsolved?
    @board.include?('.')
  end

  def update_board(guess)
    @word.each_with_index do |char, index|
      if char == guess
        @board[index] = char
      end
    end
    return @board
  end
end
