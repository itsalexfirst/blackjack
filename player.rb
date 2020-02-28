class Player
  attr_reader :name, :balance
  attr_accessor :hand

  def initialize(name)
    @name = name
    @balance = 100
    @hand = Hand.new
  end

  def can_bet?(value)
    return false unless value <= @balance
    true
  end

  def bet(value)
    @balance -= value if can_bet?(value)
  end

  def take_win(value)
    @balance += value
    free_hand
  end

  def free_hand
    @hand = Hand.new
  end
end
