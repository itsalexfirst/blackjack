# frozen_string_literal: true

class Game
  attr_reader :deck, :bets

  MAX = 10
  BLACK_JACK = 21

  def initialize(*players)
    @bets = 0
    @players = players
  end

  def score(player)
    player.hand.score
  end

  def deals
    @new_deck = Deck.new
    @players.each do |player|
      player.bet(MAX)
      @bets += MAX
      2.times { give_card(player) }
    end
  end

  def give_card(player)
    player.hand.give_card(@new_deck.take_card)
  end

  def win(player, dealer)
    dealer_lower = score(player) > score(dealer)
    if score(player) <= BLACK_JACK && dealer_lower || score(dealer) >= BLACK_JACK
      winner = player
      looser = dealer
    else
      winner = dealer
      looser = player
    end

    winner(winner)
    looser(looser)

    winner
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
    player.hand.can_give_card?
  end

  def can_start_game?
    return false unless @players.reduce(true) { |cond, player| cond && player.can_bet?(MAX) }

    true
  end
end
