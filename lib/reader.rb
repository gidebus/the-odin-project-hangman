# frozen_string_literal: true

class Reader
  def read
    File.read('10k-english-words-no-swears.txt')
  end
end