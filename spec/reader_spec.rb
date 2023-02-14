# frozen_string_literal: true

require_relative '../lib/reader'

describe Reader do
  let(:reader) { Reader.new }
  let(:file) { './test.txt' }

  describe '#read' do
    it 'reads the txt file' do
      expect(reader.read.split.first).to eq('the')
      expect(reader.read.split.last).to eq('poison')
    end
  end
end
