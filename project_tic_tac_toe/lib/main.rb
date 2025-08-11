require_relative "player"
require_relative "tic_tac_toe"

new_game = TicTacToe.new
new_game.initialize_game # Initializes the board
new_game.set_players # Sets player names
new_game.alot_sign
new_game.orient_board
new_game.loop_game
