# frozen_string_literal: true

require_relative '../lib/turn'

describe Turn do
  let(:turn) { Turn.new }
  describe '#increment_turn' do
    it 'increments turn variable each turn' do
      expect(turn.increment_turn).to eq(1)
    end
  end
end