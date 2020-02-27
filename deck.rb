class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card::VALUES.each do |value|
      Card::SUITS.each do |suit|
        card = Card.new(value, suit)
        @cards << card
      end
      @cards.shuffle!
    end
  end

  def take_card
    @cards.last unless @cards.empty?
    @cards.pop
  end
end
