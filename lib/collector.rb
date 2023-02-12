# frozen_string_literal: true

class Collector
  def collect(arr)
    arr.select { |word| word.length.between?(5, 12) }
  end
end
