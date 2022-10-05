class Player
  attr_accessor :bank, :cards

  def initialize(name)
    @name = name
    @bank = Bank.new
    @cards = []
  end

  def show_cards
    cards.each { |card| puts card.title }
  end

  def points
    points = 0
    aces = []
    @cards.each do |card|
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
end

class Dealer < Player
  def initialize
    super("Dealer")
  end
end

class Bank
  attr_accessor :cash

  def initialize
    @cash = 100
  end
end

class Game
  def initialize

  end

  def name_enter
    #puts "Enter the name of player"
    #name = gets.chomp
    @player = Player.new("name")
  end

  def start
    @dealer = Dealer.new
    @deck = Deck.new
    hand_out_cards(2)
    @player.show_cards
    puts @player.points
  end

  def hand_out_cards(count)
    (1..count).each do
      @player.cards << @deck.cards.pop
      @dealer.cards << @deck.cards.pop
    end
  end
end

class Card
  attr_reader :suit, :face, :title

  def initialize(suit, face)
    @suit = suit
    @face = face
    @title = @face.to_s + @suit
  end
end

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

game = Game.new
game.name_enter
game.start


