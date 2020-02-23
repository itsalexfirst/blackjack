class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def take_card
    @cards.last unless @cards.empty?
    @cards.pop
  end

  def shuffle
    @cards.shuffle!
  end
end
