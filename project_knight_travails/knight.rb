# This class contains all methods for Knight objects
class Knight
  def knight_moves(origin, destination)
  end

  # returns an array of maximum possible moves addatives to X and Y positions:
  # [[-1, -2], [-1, 2], [-2, -1], [-2, 1], [1, -2], [1, 2], [2, -1], [2, 1]]
  # Any knight can move 2 moves forward and 1 moves side ways
  def find_addatives(input = [-1, -2, 1, 2])
    input.permutation(2).to_a.reject { |combo| combo[0].abs == combo[1].abs }
  end

  def find_next_possible_moves(position)
    addatives = find_addatives.sort
    unfiltered_moves = addatives.map { |combo| [position[0] + combo[0], position[1] + combo[1]] }
    unfiltered_moves.reject { |combo| (combo[0].abs > 7) || (combo[1].abs > 7) }
  end
end
