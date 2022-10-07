class Deck
  attr_reader :cards

  SUITS = ["♣", "♥", "♠", "♦"]
  FACE = [2, 3, 4, 5, 6, 7, 8, 9, 10, "V", "D", "K", "T"]

  def initialize
    deck_creation
    cards.shuffle!
  end

  def deck_creation
    @cards = []
    FACE.each do |face|
      SUITS.each do |suit|
        @cards << Card.new(suit, face)
      end
    end
  end
end
