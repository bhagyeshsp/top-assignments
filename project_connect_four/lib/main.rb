require_relative "connect_four"
require_relative "player"

# PSEUDOCODE
# The game begins
# The game introduces sign * and X to the two players
# It asks player-1 to choose their sprite
# Then asks player-2 to choose their sprite
# The game displays a 6*7 empty grid
# The player-1 takes the first turn, choosing a cell by its XY coordinates
# The game records this move
# The player-2 takes the next turn, choosing a cell by its XY coordinates
# The game records this move
# The loop continues until there's a winning combo match

new_game = ConnectFour.new
new_game.loop_game
#   +---+---+---+---+---+---+---+
# 6 |   |   |   |   |   |   |   |
#   +---+---+---+---+---+---+---+
# 5 |   |   |   |   |   |   |   |
#   +---+---+---+---+---+---+---+
# 4 |   |   |   |   |   |   |   |
#   +---+---+---+---+---+---+---+
# 3 |   |   |   |   |   |   |   |
#   +---+---+---+---+---+---+---+
# 2 |   |   |   |   |   |   |   |
#   +---+---+---+---+---+---+---+
# 1 |   |   |   |   |   |   |   |
#   +---+---+---+---+---+---+---+
#     1   2   3   4   5   6   7
