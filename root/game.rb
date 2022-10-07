class Game
  attr_accessor :bank
  attr_reader :player, :dealer, :deck, :rules

  def initialize
    @rules = Rules.new
    @player = Player.new("name", @rules)
    @dealer = Dealer.new(@rules)
    @deck = Deck.new
    @bank = 0
  end

  def start # make local game class
    (1..2).each do |round|
      hand_out_cards(player, round)
      break if player.decision == :open # dont forget nil
      hand_out_cards(dealer, round)
    end

    winner,loser = rules.detect_winner(player, dealer)
    share_prize(winner)
    anounce_results(winner, loser)
  rescue HandOverFlow => error
    winner = error.loser == player ? dealer : player
    share_prize(winner)
    anounce_results(winner, error.loser)
  end

  def hand_out_cards(user, round)
    count = round == 1 ? 2 : 1
    return if round == 2 && %i(skip open).include?(user.make_decision)
    user.cards.push(*deck.cards.pop(count))
    raise HandOverFlow.new(user) if rules.cards_overflow?(user.cards)
  end

  def share_prize(winner)
    if winner
      winner.bank += bank
    else
      player.bank += bank / 2
      dealer.bank += bank / 2
    end
    bank = 0
  end

  def anounce_results(winner, loser)
    if winner
      puts "#{winner} #{winner.points}"
      puts "#{loser} #{loser.points}"
    else
      puts "draw"
    end
  end

  def name_enter
    #puts "Enter the name of player"
    #name = gets.chomp
    @player = Player.new("name", rules)
  end

  def show_result
    puts "Your cards: #{player.show_cards.join(" ")}, points: #{player.points}"
    puts "Dealer cards: #{dealer.show_cards.join(" ")}"
  end



  def open_cards
    @player_points = player.points
    @dealer_points = dealer.points
    puts "Your points #{@player_points}"
    puts "Dealer points #{@dealer_points}"
  end
end
