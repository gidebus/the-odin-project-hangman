
class Board
  attr_accessor :word, :board, :wrong_guesses
  
  def initialize(word)
    @word = word.split('')
    @board = Array.new(word.length, '.')
    @wrong_guesses = ''
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

  def add_guess(char)
    @wrong_guesses.concat(char) unless is_guess_in_word?(char)
  end

  def errors
    @wrong_guesses.length
  end
end
