# frozen_string_literal: true

require_relative './reader'
require_relative './selector'
require_relative './collector'
require_relative './parser'
require_relative './turn'
require_relative './board'

require 'json'

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
    @board = board
  end

  def to_json
    JSON.dump ({
      'reader' => @reader,
      'selector' => @selector,
      'parser' => @parser,
      'collector' => @collector,
      'turn' => @turn.to_json,
      'board' => @board.to_json
    })
  end

  def self.from_json(string)
    data = JSON.load(string)
    self.new(
      Reader.new,
      Selector.new,
      Parser.new,
      Collector.new,
      Turn.from_json(data['turn']),
      Board.from_json(data['board'])
    )
  end

  # TODO: move to writer class
  def write_file
    Dir.mkdir('saved') unless Dir.exist?('saved')
    puts 'name the game file'
    file_name = gets.chomp
    file_name = "saved/#{file_name}.json"

    File.open(file_name, 'w') do |filename|
      filename.write to_json 
    end

    puts file_name
  end

  # TODO: move to game_manager class
  def would_you_like_to_save
    puts 'would you like to save? y/n'
    input = gets.chomp.downcase
    until input == 'y' || input == 'n'
      would_you_like_to_save
    end
    write_file if input == 'y'
  end

  # TODO: move to game_manager class
  def self.load_game
    puts 'choose file to load'
    filename = gets.chomp.downcase
    saved = File.read("saved/#{filename}")
    game = Game.from_json(saved)
    game
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

  def update_board_if_correct(guess)
    if @board.is_guess_in_word?(guess)
      @board.update_board(guess)
    end
  end

  def start_game
    while game_not_over?
      puts " \n guesses: #{@board.wrong_guesses} word: #{@board.board.join}  turn: #{@turn.turn} errors: #{@board.errors}/7"
      guess = take_a_guess
      update_board_if_correct(guess)
      @board.add_guess(guess)
      @turn.increment_turn
      would_you_like_to_save
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
    if won?
      puts "\n Congratulations, you guessed it!"
    else
      puts "The word was #{@board.word.join}. Better luck next time."
    end
  end
end
