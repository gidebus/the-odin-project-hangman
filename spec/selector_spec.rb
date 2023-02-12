# frozen_string_literal: true

require_relative '../lib/selector'

describe Selector do
  let(:selector) { Selector.new }
  let(:arr) { ['random', 'random'] }
  
  describe '#select' do
    it 'selects a random word' do
      expect(selector.select(arr)).to eq('random')
    end
  end
end
