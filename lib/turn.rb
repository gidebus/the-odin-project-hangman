# frozen_string_literal: true

class Turn 
  attr_accessor :turn

  def initialize(turn = 1)
    @turn = turn
  end

  def to_json
    JSON.dump({
      :turn => @turn
    })
  end

  def self.from_json(string)
    data = JSON.load(string)
    self.new(
      data['turn']
    )
  end

  def increment_turn
    @turn += 1
  end
end
