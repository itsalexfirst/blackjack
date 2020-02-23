class Table
  attr_reader :deck :bets

  def initialize(deck)
    @deck = deck
    @bets = 0
  end

  def new_round
  end
end
