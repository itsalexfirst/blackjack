class Card
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  SUITS = ['♣', '♦', '♥', '♠']

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    "#{@value}#{@suit}"
  end
end
