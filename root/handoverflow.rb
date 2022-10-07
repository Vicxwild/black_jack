class HandOverFlow < StandardError
  attr_reader :loser

  def initialize(loser)
    @loser = loser
    super("#{loser} lose, points are more 21")
  end
end
