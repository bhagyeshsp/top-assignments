require_relative "connect_four"
require_relative "player"

# PSEUDOCODE
# The game begins
# It asks player-1 to choose their sprite
# Then asks player-2 to choose their sprite
# The game displays a 6*7 empty grid
# The player-1 takes the first turn, choosing a cell by its XY coordinates
# The game records this move
# The player-2 takes the next turn, choosing a cell by its XY coordinates
# The game records this move
# The loop continues until there's a winning combo match

#   +---+---+---+---+---+---+---+
# 6 | o | o | o | o | o | o | o |
#   +---+---+---+---+---+---+---+
# 5 | o | o | o | o | o | o | o |
#   +---+---+---+---+---+---+---+
# 4 | o | o | o | o | o | o | o |
#   +---+---+---+---+---+---+---+
# 3 | o | o | o | o | o | o | o |
#   +---+---+---+---+---+---+---+
# 2 | o | o | o | o | o | o | o |
#   +---+---+---+---+---+---+---+
# 1 | o | o | o | o | o | o | o |
#   +---+---+---+---+---+---+---+
#     1   2   3   4   5   6   7
