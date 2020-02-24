class Game
  def initialize
    @deck = Deck.new(Card.all)
    @dealer = Dealer.new
  end

  def start
    @player = ask_name
    @table = Table.new(@deck, @player, @dealer)


    @table.deals

    round

    score

    play_again
  end

  def round
    #show_card
    #show_score
    #player_turn
    #dealer_turn
  end

  def score
  end

  def play_again
  end

  def ask_name
    puts 'Enter your name'
    name = gets.chomp
    return Player.new(name)
  end
end
