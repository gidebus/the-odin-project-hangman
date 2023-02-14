# frozen_string_literal: true

class Turn 
  attr_accessor :turn

  def initialize(turn = 0)
    @turn = turn
  end

  def increment_turn
    @turn += 1
  end
end
