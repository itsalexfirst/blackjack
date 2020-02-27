class Dealer
  attr_reader :name, :balance
  attr_accessor :hand

  def initialize
    @name = Dealer
    @balance = 100
    @hand = []
  end

  def can_bet?(value)
    return false unless value <= @balance
    true
  end

  def bet(value)
    @balance -= value if self.can_bet?(value)
  end

  def take_win(value)
    @balance += value
    self.free_hand
  end

  def free_hand
    @hand = []
  end
end
