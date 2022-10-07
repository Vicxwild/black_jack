class Dealer
  attr_accessor :bank, :cards, :make_decision, :rules

  def initialize(rules)
    @rules = rules
    @bank = 100
    @cards = []
  end

  def show_cards
    cards.map { |card| "★" }
  end

  def make_decision
    if skip_card?
      :skip
    else
      :add
    end
  end

  def skip_card?
    rules.points(cards) > 17
  end

  def points
    rules.points(cards)
  end

  def to_s
    self.class.to_s
  end
end
