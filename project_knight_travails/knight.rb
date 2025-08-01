# This class contains all methods for Knight objects
class Knight
  def initialize
    @visit_history = []
    @child_parent_pairs = {}
    @origin = []
    @destination = []
  end

  def knight_moves(origin, destination)
    @origin = origin
    @destination = destination
    recursive_next_moves([origin], destination)
  end

  # Adds all possible 8 combinations of moves and filters out illegal moves
  # Here, degree_of_freedom is possible moves for a knight
  def find_next_possible_moves(position)
    degree_of_freedom = [[-1, -2], [-1, 2], [-2, -1], [-2, 1], [1, -2], [1, 2], [2, -1], [2, 1]]

    unfiltered_moves = degree_of_freedom.map { |move| [position[0] + move[0], position[1] + move[1]] }

    unfiltered_moves.reject do |move|
      (move[0].abs > 7) || (move[1].abs > 7) || move[0].negative? || move[1].negative? || @visit_history.include?(move)
    end
  end

  # The method begins with the starting position as the next_move_arr
  def recursive_next_moves(next_moves_arr, destination)
    p "Next moves arr: #{next_moves_arr}"

    i = 0
    while i <= (next_moves_arr.size - 1)

      @visit_history << next_moves_arr[i]
      p generated_moves = find_next_possible_moves(next_moves_arr[i])
      log_child_parent(generated_moves, next_moves_arr[i])
      return trace_parents(@child_parent_pairs, next_moves_arr[i]) if generated_moves.include?(destination)

      i += 1
    end
    recursive_next_moves(generated_moves, destination)
  end

  # Created child:parent hash entries, provides fast parent lookup
  def log_child_parent(children, parent)
    children.each { |child| @child_parent_pairs[child] = parent }
    @child_parent_pairs
  end

  # Traces the parent move of the provided child move
  # This helps create the trace once the destination is reached
  def trace_parents(pairs, start_child, target_parent = @origin)
    path = [start_child]
    current = start_child

    while pairs[current] && pairs[current] != target_parent
      current = pairs[current]
      path << current
    end

    return nil unless pairs[current] == target_parent

    path << target_parent
    path.reverse!
    path << @destination
  end
end
