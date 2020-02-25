class Game
  def initialize
    @deck = Deck.new(Card.all)
    @dealer = Dealer.new
    @round_run = true
  end

  def start
    @player = ask_name
    @table = Table.new(@deck, @player, @dealer)


    @table.deals

    round

    #score

    play_again
  end

  def round
    show_card(@player)
    show_score(@player)

    show_card(@dealer)
    show_score(@dealer)

    #player_turn
    #dealer_turn
  end


  def score(player)
    @table.score(player)
  end

  def show_card(player)
    print "#{player.name} :"
    if @round_run && player.class == Dealer
      print "#{ '* ' * player.hand.length}"
    else
      print "#{player.hand.join(' ')} "
    end
  end

  def show_score(player)
    if @round_run && player.class == Dealer
      puts 'score: * '
    else
      print "score: #{score(player)}\n"
    end
  end

  def player_turn
    puts '1. Skip 2. Take card 3. Show card'
  end

  def play_again
  end

  def ask_name
    puts 'Enter your name'
    name = gets.chomp
    return Player.new(name)
  end
end
