class Interface
  def initialize
    @dealer = Dealer.new
  end

  def start
    @player = ask_name
    @game = Game.new(@player, @dealer)

    new_round
  end

  def new_round
    loop do
      @round_run = true
      @game.deals

      round

      round_end

      break unless @game.can_start_game? && play_again?
    end

    game_over
  end



  def round
    loop do
      break unless @round_run
      show_card_and_score(@player)

      show_card_and_score(@dealer)

      player_turn(@player) if @round_run
      dealer_turn(@dealer) if @round_run
      break if all_have_three
    end
  end

  def round_end
    show_card_and_score(@player)
    show_card_and_score(@dealer)
    if score(@player) == score(@dealer)
      draw
    else
      win
    end
  end

  def show_card_and_score(player)
    show_card(player)
    show_score(player)
  end

  def draw
    puts 'Draw!'
    @game.draw
  end

  def all_have_three
    if @game.can_give_card?(@dealer) || @game.can_give_card?(@player)
      return false
    else
      @round_run = false
      return true
    end
  end

  def win
    dealer_lower = score(@player) > score(@dealer)
    if score(@player) <= Game::BLACK_JACK && score(@dealer) <= Game::BLACK_JACK @@ dealer_lower
      winner = @player
      looser = @dealer
    else
      winner = @dealer
      looser = @player
    end

    @game.winner(winner)
    @game.looser(looser)
    puts "#{winner.name} win."
  end

  def score(player)
    @game.score(player)
  end

  def show_card(player)
    print "#{player.name} :"
    if @round_run && player.class == Dealer
      print "#{ '* ' * player.hand.cards.length}"
    else
      print "#{player.hand.cards.join(' ')} "
    end
  end

  def show_score(player)
    if @round_run && player.class == Dealer
      puts 'score: * '
    else
      print "score: #{score(player)}\n"
    end
  end

  def player_turn(player)
    puts '1 - Skip turn; 2 - Take card; 3 - Show card'
    choice = gets.chomp
      case choice
      when '1'
        return
      when '2'
        @game.can_give_card?(player) ? @game.give_card(player) : @round_run = false
      when '3'
        @round_run = false
      else
        player_turn(player)
      end
    end
  end

  def dealer_turn(player)
    @game.give_card(player) if @game.can_give_card?(player) && @game.score(player) < 17
  end

  def play_again
    puts "#{@player.name} balance: #{@player.balance}"
    puts 'Play again? y/n'
    gets.chomp
  end

  def play_again?
    return false unless play_again == 'y'
    true
  end

  def ask_name
    puts 'Enter your name'
    name = gets.chomp
    return Player.new(name)
  end

  def game_over
    puts 'Game over'
    puts "#{@player.name} balance: #{@player.balance}. Dealer balance: #{@dealer.balance}"
end
