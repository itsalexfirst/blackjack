class Table
  attr_reader :deck, :bets

  MAX = 10
  BLACK_JACK = 21

  def initialize(deck, *players)
    @deck = deck
    @bets = 0
    @players = players
  end

  def score(player)
    return 0 unless player.hand != []
    score = 0
    have_ace = false
    player.hand.each do |card|
      score += card.cost
      have_ace ||= card.ace?
    end
    score -= 10 if score > BLACK_JACK && have_ace
    return score
  end

  def deals
    @new_deck = @deck
    @new_deck.shuffle
    @players.each do |player|
      player.bet(MAX)
      @bets += MAX
      2.times { give_card(player) }
    end
  end

  def give_card(player)
    player.hand << @new_deck.take_card
  end

  def winner(player)
    player.take_win(@bets)
    @bets = 0
  end

  def looser(player)
    player.free_hand
  end

  def draw
    @players.each { |player| player.take_win(MAX) }
    @bets = 0
  end

  def can_give_card?(player)
    return false if player.hand.count == 3
    true
  end

  def can_start_game?
    return unless @players.each { |player| player.can_bet?(MAX)}
    true
  end
end
