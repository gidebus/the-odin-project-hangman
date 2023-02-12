# frozen_string_literal: true

require_relative '../lib/collector'

describe Collector do
  let(:collector) { Collector.new }
  let(:arr) { ['123', '12345', '1234567', '123456789012', '1234567890123'] }

  describe '#collect' do
    it 'collects words between 5 to 12 characters in length into an array' do
      expected = ['12345', '1234567', '123456789012']
      expect(collector.collect(arr)).to eq(expected)
    end
  end
end
