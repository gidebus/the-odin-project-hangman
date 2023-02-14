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
end
