class Round
  attr_reader :player, :dealer, :rules, :deck, :bank

  def initialize(player, dealer, rules)
    @player = player
    @dealer = dealer
    @rules = rules
    @deck = Deck.new
    @bank = 0
  end

  def start
    (1..2).each do |round|
      hand_out_cards(player, round)
      break if player.decision == :open # dont forget nil
      hand_out_cards(dealer, round)
      bank = player.bet + dealer.bet
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
      puts "Winner: #{winner} #{winner.points} #{winner.show_cards}"
      puts "Loser: #{loser} #{loser.points} #{loser.show_cards}"
    else
      puts "Draw"
    end
  end

  private
  attr_writer :bank
end
