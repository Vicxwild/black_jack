class Dealer
  attr_accessor :bank, :cards
  attr_reader :name, :rules

  def initialize(rules)
    @rules = rules
    @bank = 100
    @cards = []
  end

  def show_cards
    cards_title = cards.map { |card| card.title }
    cards_title.join(" ")
  end

  def show_stars
    cards_title = cards.map { |card| "★" }
    cards_title.join(" ")
  end

  def make_decision
    if skip_card?
      :skip
    else
      :add
    end
  end

  def bet
    self.bank -= 10
    10
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
