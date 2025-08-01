# This class contains all methods for Knight objects
class Knight
  def knight_moves(origin, destination)
    next_moves = find_next_possible_moves(origin)
    return destination if next_moves.any?(destination)

    recursive_next_moves(next_moves, destination)
  end

  # returns an array of maximum possible moves addatives to X and Y positions:
  # [[-1, -2], [-1, 2], [-2, -1], [-2, 1], [1, -2], [1, 2], [2, -1], [2, 1]]
  # Any knight can move 2 moves forward and 1 moves side ways
  def find_addatives(input = [-1, -2, 1, 2])
    input.permutation(2).to_a.reject { |combo| combo[0].abs == combo[1].abs }
  end

  def find_next_possible_moves(position)
    addatives = [[-1, -2], [-1, 2], [-2, -1], [-2, 1], [1, -2], [1, 2], [2, -1], [2, 1]]
    p "position: #{position}"
    unfiltered_moves = addatives.map { |combo| [position[0] + combo[0], position[1] + combo[1]] }
    p unfiltered_moves
    sleep 1
    unfiltered_moves.reject { |combo| (combo[0].abs > 7) || (combo[1].abs > 7) }
  end

  # [[1, 1], [1, 3], [2, 0], [2, 4], [4, 0], [4, 4], [5, 1], [5, 3]]
  def recursive_next_moves(next_moves_arr, destination, trail = [], generated_lib = [], round = 1)
    p "Next moves arr: #{next_moves_arr}"

    i = 0
    while i <= (next_moves_arr.size - 1)
      trail << next_moves_arr[i]
      generated_moves = find_next_possible_moves(next_moves_arr[i])
      generated_lib << generated_moves
      p generated_lib
      p "generated moves are: #{generated_moves}"
      return trail if generated_moves.include?(destination)

      trail.shift
      i += 1
    end
    round += 1
    recursive_next_moves(generated_lib.flatten(1), destination, trail, generated_lib, round)
  end

  # Returns whether the next_moves array contains the destination tile
  def reached?(destination, next_moves)
    next_moves.include?(destination)
  end
end
