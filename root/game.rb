class Game
  attr_reader :player, :dealer, :rules, :round

  def initialize
    @rules = Rules.new
    @dealer = Dealer.new(@rules)
  end

  def name_enter
    puts "Enter the name of player"
    name = gets.chomp
    self.player = Player.new(name, rules)
  end

  def game_progress
    puts "Do you want to play again? Enter \"y\" if yes, \"n\" if no"
    choise = gets.chomp.to_sym
    case choise
    when :y
      refresh
      new_round
    when :n
      exit
    end
  end

  def new_round
    round = Round.new(player, dealer, rules)
    round.start
  end

  def refresh
    player.decision = nil
    player.cards = []
    dealer.cards = []
  end

  private
  attr_writer :round, :player
end
