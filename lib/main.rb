# frozen_string_literal: true

require_relative './game'

puts 'welcome to CLI Hangman. Would you like to load a game or start a new? load/new'
input = gets.chomp.downcase

if input == 'load'
  game = Game.load_game
  game.start_game
elsif input == 'new'
  game = Game.new
  game.setup_board
  game.start_game
end
