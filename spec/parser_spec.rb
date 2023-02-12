# frozen_string_literal: true 

require_relative '../lib/parser'

describe Parser do
  let(:parser) { Parser.new }
  let(:content) { 'hello from txt!' }

  describe '#parse' do
    it 'parses string into an array' do
      expected = ['hello', 'from', 'txt!']
      expect(parser.parse(content)).to eq(expected)
    end
  end
end
