require_relative "./player.rb"
require_relative "./dealer.rb"
require_relative "./deck.rb"
require_relative "./card.rb"

require_relative "./bank.rb"
require_relative "./game.rb"


#p pl = Player.new('dsf').bet

game = Game.new
game.name_enter
game.start
game.adding_card_to_player
game.open_cards

