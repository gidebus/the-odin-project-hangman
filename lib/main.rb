# frozen_string_literal: true

require_relative './reader'
require_relative './selector'
require_relative './collector'
require_relative './parser'

reader = Reader.new
selector = Selector.new
parser = Parser.new
collector = Collector.new

txt = reader.read

words = parser.parse(txt)
words = collector.collect(words)
word = selector.select(words)

p word