require "pry-byebug"

require_relative "intelligence_module"
require_relative "mastermind_game"
require_relative "human_player"
require_relative "computer_player"

game = MasterMind.new
human_player = HumanPlayer.new("Bhagyesh")
puts "choosing mastermind"
game.choose_mastermind(human_player.name, game)
