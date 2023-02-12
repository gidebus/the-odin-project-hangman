# frozen_string_literal: true

require_relative '../lib/reader'

describe Reader do
  let(:reader) { Reader.new }
  let(:file) { './test.txt' }

  describe '#read' do
    it 'reads the txt file' do
      # allow(File).to receive(:read).with(file)
      expect(reader.read.split.first).to eq('the')
    end
  end
end
