# NOTE: The Decorator design pattern facilitates the addition of 
#       behaviors to individual objects without inheriting from them.
#       

require_relative './game/games/example'

game_example = Games::Example.new
game_example.next_round

# Game::Base#next_round with , {}
# Game::TriggerSpin#next_round with , {:spin=>true}
# Game::Features::StickySymbol#next_round with , {:spin=>true, :sticky_simbols=>[0, 1, 5, 10]}
