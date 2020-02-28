class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def give_card(card)
    @cards << card
  end

  def can_give_card?
    return false if @cards.count == 3
    true
  end

  def score
    return 0 unless @cards != []
    score = 0
    have_ace = false
    @cards.each do |card|
      score += card.cost
      have_ace ||= card.ace?
    end
    score -= 10 if score > Game::BLACK_JACK && have_ace
    return score
  end
end


