class Player
  attr_accessor :cash, :cards

  def initialize(name)
    @name = name
    @cash = Bank.new.cash
    @cards = []
  end

  def show_cards
    cards.map { |card| card.title }
  end

  def points
    points = 0
    aces = []
    cards.each do |card|
      if card.face.is_a?(Integer)
        points += card.face
      elsif card.face == "T"
        aces << card
      else
        points += 10
      end
    end
    aces.each do
      if points >= 11
        points += 1
      else
        points += 11
      end
    end
    points
  end

  def bet
    self.cash -= 10
    10
  end




end



