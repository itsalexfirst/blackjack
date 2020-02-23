class Table
  attr_reader :deck :bets

  def initialize(deck, *players)
    @deck = deck
    @bets = 0
    @players = players
  end

  def score(player)
    return 0 unless player.hand == []
    score = 0
    player.hand.each do |card|
      score += card.cost
      #ace method
    return score
    end
  end

  def deals
    @new_deck = @deck.shuffle
    @players.each do |player|
      player.bet(10)
      @bets += 10
      player.hand << new_deck.take_card
      player.hand << new_deck.take_card
    end
  end
#наверное нужен другой класс
  #def start_new_game
  #  deals if @players.each { |player| player.can_bet?(10) }
  #  unless end_game

  end
end
