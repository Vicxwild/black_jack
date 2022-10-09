class Game
  attr_reader :player, :dealer, :rules, :round, :choise

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
    loop do
      break if player.bank.zero? || dealer.bank.zero?

      puts "Do you want to play again? Enter \"y\" if yes, \"n\" if no"
      choise = gets.chomp.to_sym
      player_choise(choise)
    end
  end

  def player_choise(choise)
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
    player.refresh
    dealer.refresh
  end

  private

  attr_writer :round, :player, :choise
end
