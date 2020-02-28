# frozen_string_literal: true

class Card
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  SUITS = ['♣', '♦', '♥', '♠'].freeze

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    "#{@value}#{@suit}"
  end

  def ace?
    @value == 'A' ? true : false
  end

  def cost
    return 11 if @value == 'A'
    return 10 if %w[J Q K].include? @value

    @value
  end
end
