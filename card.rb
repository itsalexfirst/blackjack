class Card
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  SUITS = ['♣', '♦', '♥', '♠']

  def self.all
    new_deck = []
    VALUES.each do |value|
      SUITS.each do |suit|
        card = Card.new(value, suit)
        new_deck << card
      end
    end
    new_deck
  end

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    "#{@value}#{@suit}"
  end

  def ace?
    return false unless @value == 'A'
    true
  end

  def cost
    return 11 if @value == 'A'
    return 10 if ['J', 'Q', 'K'].include?@value
    @value
  end
end
