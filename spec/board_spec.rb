# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  let(:word) { 'testing' }
  let(:board) { Board.new(word) }

  describe '#initialize' do
    it 'initializes an empty board' do
      expected = ['.', '.', '.', '.', '.', '.', '.']
      expect(board.board).to eq(expected)
    end
  end

  describe '#is_guess_in_word?' do
    it 'returns true if guessed char is in word' do
      guess = 'e'
      expect(board.is_guess_in_word?(guess)).to eq(true)
    end

    it 'returns false if the guessed char is NOT in word' do
      guess = 'a'
      expect(board.is_guess_in_word?(guess)).to eq(false)
    end
  end

  describe '#update_board' do
    it 'updates the board if char is in word' do
      char = 't'
      expected = ['t', '.', '.', 't', '.', '.', '.']
      expect(board.update_board(char)).to eq(expected)
    end

    it 'does NOT update the board if char is NOT in word' do
      char = 'w'
      expected = ['.', '.', '.', '.', '.', '.', '.']
      expect(board.update_board(char)).to eq(expected)
    end
  end

  describe '#is_word_unsolved?' do
    it 'returns true if board remains unsolved' do
      expect(board.is_word_unsolved?).to eq(true)
    end
  end

  describe '#add_guesses' do
    it 'adds the incorrect guesses' do
      guess = 'a'
      board.add_guess(guess)
      expect(board.wrong_guesses).to eq('a')

      second_guess = 'b'
      board.add_guess(second_guess)
      expect(board.wrong_guesses).to eq('ab')
    end

    it 'does not add correct guesses' do
      correct_guess = 't'
      board.add_guess(correct_guess)
      expect(board.wrong_guesses).to eq('')
    end
  end

  describe '#errors' do
    it 'returns the correct number of errors' do
      guess = 'a'
      board.add_guess(guess)
      expect(board.errors).to eq(1)

      second_guess = 'b'
      board.add_guess(second_guess)
      expect(board.errors).to eq(2)

      correct_guess = 't'
      board.add_guess(correct_guess)
      expect(board.errors).to eq(2)
    end
  end
end
