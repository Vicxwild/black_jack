require_relative "./root/player.rb"
require_relative "./root/dealer.rb"
require_relative "./root/deck.rb"
require_relative "./root/card.rb"
require_relative "./root/game.rb"
require_relative "./root/handoverflow.rb"
require_relative "./root/rules.rb"
require_relative "./root/round.rb"

game = Game.new
game.name_enter
game.new_round
game.game_progress
