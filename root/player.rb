class Player
  attr_accessor :bank, :decision, :cards
  attr_reader :name, :rules

  DECISIONS = {
    1 => :skip,
    2 => :open,
    3 => :add
  }.freeze

  def initialize(name, rules)
    @name = name
    @rules = rules
    @bank = 100
    @cards = []
  end

  def show_cards
    cards_title = cards.map(&:title)
    cards_title.join(" ")
  end

  def bet
    self.bank -= 10
    10
  end

  def make_decision
    puts "Your cards #{show_cards}, points #{rules.points(cards)}"
    puts "Press 1 to skip, to open the cards - 2, to add the card - 3"
    choise = gets.chomp.to_i
    self.decision = DECISIONS.fetch(choise)
  end

  def points
    rules.points(cards)
  end

  def to_s
    name
  end
end
