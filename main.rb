require_relative "./root/player.rb"
require_relative "./root/dealer.rb"
require_relative "./root/deck.rb"
require_relative "./root/card.rb"
require_relative "./root/game.rb"
require_relative "./root/handoverflow.rb"
require_relative "./root/rules.rb"


#p pl = Player.new('dsf').bet

game = Game.new
game.start

