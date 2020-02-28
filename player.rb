# frozen_string_literal: true

class Player
  attr_reader :name, :balance
  attr_accessor :hand

  def initialize(name)
    @name = name
    @balance = 100
    @hand = Hand.new
  end

  def can_bet?(value)
    value <= @balance ? false : true
  end

  def bet(value)
     can_bet?(value) ? @balance -= value : nil
  end

  def take_win(value)
    @balance += value
    free_hand
  end

  def free_hand
    @hand = Hand.new
  end
end
