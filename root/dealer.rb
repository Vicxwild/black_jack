class Dealer
  attr_accessor :bank
  attr_reader :name, :rules, :cards

  def initialize(rules)
    @rules = rules
    @bank = 100
    @cards = []
  end

  def show_cards
    cards_title = cards.map(&:title).join(" ")
  end

  def show_stars
    ("★ " * 2).strip
  end

  def make_decision
    skip_card? ? :skip : :add
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

  def refresh
    self.cards = []
  end

  private

  attr_writer :cards
end
