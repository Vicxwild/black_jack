class Game
  attr_accessor :bank
  attr_reader :player, :dealer, :deck, :rules

  NEW_ROUND = [
    { title: 'start new round', action: :new_round! },
    { title: 'quit the game', action: :exit }
  ].freeze

  def initialize
    name_enter
    @rules = Rules.new
    @dealer = Dealer.new(@rules)
    @deck = Deck.new
    @bank = 0
    # start - ne krashit igru
  end

  def start
    (1..2).each do |round|
      hand_out_cards(player, round)
      break if player.decision == :open
      hand_out_cards(dealer, round)
    end
    winner =  rules.detect_winner(player, dealer)

    share_prize(winner)
  rescue HandOverFlow => error
    winner = error.loser == player ? dealer : player
    share_prize(winner)
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



  def name_enter
    #puts "Enter the name of player"
    #name = gets.chomp
    @player = Player.new("name", rules)
  end

  def start
    hand_out_cards(player, 2)
    hand_out_cards(dealer, 2)
    self.bank += (player.bet + dealer.bet)
    show_result
    new_round?
  end

  def show_result
    puts "Your cards: #{player.show_cards.join(" ")}, points: #{player.points}"
    puts "Dealer cards: #{dealer.show_cards.join(" ")}"
  end

  def hand_out_cards(user, round)
    count = round == 1 ? 2 : 1
    return if round == 2 && user.make_decision == :skip
    user.cards << @deck.cards.pop(count)
    raise HandOverFlow if rules.cards_overflow?(user.cards) # napisat Error
  end



  def add_card(user)
    return "Can't add cards" if user.cards.count > 2
    hand_out_cards(user, 1)
  end

  def adding_card_to_player
    add_card(player)
    puts player.show_cards.join(" ")
  end

  def skipping
    # skip a move
  end

  def open_cards
    @player_points = player.points
    @dealer_points = dealer.points
    puts "Your points #{@player_points}"
    puts "Dealer points #{@dealer_points}"
  end

  def cheking_points

  end

  def new_round!
    refresh

  end

  def refresh
    deck = Deck.new
  end

  def new_round?
    puts "Enter your choise"
    NEW_ROUND.each.with_index(1) { |item, index| puts "#{index} -> #{item[:title]}" }
    choise = gets.chomp.to_i
    selected_item = NEW_ROUND[choise - 1]
    send(selected_item[:action])
  end

  def lose
    dealer.cash += self.bank
    puts "You lose"
  end

  def draw
    dealer.cash += (self.bank / 2)
    player.cash += (self.bank / 2)
    puts "Draw"

  end

  def win
    player.cash += self.bank
    puts "You win"
  end
end
