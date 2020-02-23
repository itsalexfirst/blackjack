class Player
  attr_reader :name, :balance
  attr_accessor :hand

  def initialize(name)
    @name = name
    @balance = 100
    @hand = []
  end

  def can_bet?(value)
    return unless value <= @balance
    true
  end

  def bet(value)
    @balance -= value if self.can_bet?(value)
  end

  def take_win(value)
    @balance += value
    @hand = []
  end
end
