class Dealer
  def initialize(rules)
    @rules = rules
    @cash = 100
    @cards = []
  end

  def show_cards
    cards.map { |card| "★" }
  end

  def skip_card?
    rules.points(cards) > 17
  end
end
