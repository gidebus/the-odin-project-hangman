# frozen_string_literal: true

class WordManager
  attr_accessor :word, :board
  
  def initialize(word)
    @word = word
    @board = Array.new(word.length, '.')
  end
end
