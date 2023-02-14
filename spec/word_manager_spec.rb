# frozen_string_literal: true

require_relative '../lib/word_manager'

describe WordManager do
  let(:word) { 'testing' }
  let(:manager) { WordManager.new(word) }

  describe '#initialize' do
    it 'initializes an empty board' do
      expected = ['.', '.', '.', '.', '.', '.', '.']
      expect(manager.board).to eq(expected)
    end
  end

  describe '#is_guess_in_word?' do
    it 'returns true if guessed char is in word' do
      guess = 'e'
      expect(manager.is_guess_in_word?(guess)).to eq(true)
    end

    it 'returns false if the guessed char is NOT in word' do
      guess = 'a'
      expect(manager.is_guess_in_word?(guess)).to eq(false)
    end
  end

  describe '#update_board' do
    it 'updates the board if char is in word' do
      char = 't'
      expected = ['t', '.', '.', 't', '.', '.', '.']
      expect(manager.update_board(char)).to eq(expected)
    end

    it 'does NOT update the board if char is NOT in word' do
      char = 'w'
      expected = ['.', '.', '.', '.', '.', '.', '.']
      expect(manager.update_board(char)).to eq(expected)
    end
  end

  describe '#is_word_unsolved?' do
    it 'returns true if board remains unsolved' do
      expect(manager.is_word_unsolved?).to eq(true)
    end
  end

  describe '#add_guesses' do
    it 'adds the incorrect guesses' do
      guess = 'a'
      manager.add_guess(guess)
      expect(manager.wrong_guesses).to eq('a')

      second_guess = 'b'
      manager.add_guess(second_guess)
      expect(manager.wrong_guesses).to eq('ab')
    end

    it 'does not add correct guesses' do
      correct_guess = 't'
      manager.add_guess(correct_guess)
      expect(manager.wrong_guesses).to eq('')
    end
  end
end
