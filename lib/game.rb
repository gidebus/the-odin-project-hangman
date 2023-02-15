# frozen_string_literal: true

require_relative './reader'
require_relative './selector'
require_relative './collector'
require_relative './parser'
require_relative './turn'
require_relative './board'

class Game
  def initialize(
    reader = Reader.new,
    selector = Selector.new,
    parser = Parser.new,
    collector = Collector.new,
    turn = Turn.new,
    board = nil
  )
    @reader = reader
    @selector = selector
    @parser = parser
    @collector = collector
    @turn = turn
    @board = nil
  end

  def setup_board
    txt = @reader.read
    words = @parser.parse(txt)
    words = @collector.collect(words)
    word = @selector.select(words)
    @board = Board.new(word)
  end

  def take_a_guess
    print 'guess: '
    guess = gets.chomp.downcase
  end
  
  def errored_out?
    @board.errors != 7
  end
  
  def game_not_over?
    errored_out? && @board.is_word_unsolved?
  end

  def start_game
    while game_not_over?
      puts ''
      puts "guesses: #{@board.wrong_guesses} word: #{@board.board.join}  turn: #{@turn.turn} errors: #{@board.errors}/7"
      guess = take_a_guess
      if @board.is_guess_in_word?(guess)
        @board.update_board(guess)
      end
      @board.add_guess(guess)
      @turn.increment_turn
    end
    win_lose_message
  end

  def won?
    errored_out? && !@board.is_word_unsolved?
  end

  def lost?
    !game_not_over?
  end

  def win_lose_message
    puts ''
    if won?
      puts 'Congratulations, you guessed it!'
    else
      puts "The word was #{@board.word.join}. Better luck next time."
    end
  end
end
