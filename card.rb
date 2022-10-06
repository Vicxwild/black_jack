class Card
  attr_reader :suit, :face, :title

  def initialize(suit, face)
    @suit = suit
    @face = face
    @title = @face.to_s + @suit
  end
end
