class Game
  attr_accessor :bank
  attr_reader :player, :dealer

  def initialize
    @bank = 0
  end

  def name_enter
    #puts "Enter the name of player"
    #name = gets.chomp
    @player = Player.new("name")
  end

  def start
    @dealer = Dealer.new
    @deck = Deck.new
    hand_out_cards(player, 2)
    hand_out_cards(dealer, 2)
    @player.show_cards
    self.bank += (player.bet + dealer.bet)
    puts @player.points
  end

  def hand_out_cards(user, count)
    (1..count).each do
      user.cards << @deck.cards.pop
    end
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
    puts "Your points #{player.points}"
    puts "Dealer's points #{dealer.points}"
  end
end
