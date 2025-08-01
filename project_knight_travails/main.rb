require_relative "knight"

new_knight = Knight.new
# p new_knight.find_next_possible_moves([3, 2])
p new_knight.knight_moves([0, 0], [7, 7])
