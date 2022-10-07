class Player
  attr_accessor :bank, :cards, :decision


  DECISIONS = {
    1 => :skip,
    2 => :open,
    3 => :add
  }

  def initialize(name, rules)
    @name = name
    @rules = rules
    @bank = 100
    @cards = []
  end

  def show_cards
    cards.map { |card| card.title }
  end

  def bet
    self.cash -= 10
    10
  end

  def make_decision
    puts "Your cards #{show_cards}, points #{rules.points(cards)}"
    puts "Press 1 to skip, to open the cards - 2, to add the card - 3"
    choise = gets.chomp.to_i
    decision = DECISIONS.fetch(choise)
  end

  def points
    rules.points(cards)
  end

  def to_s
    name
  end

  private
  attr_reader :rules, :name
end



