# This is intelligence module for computer player
module Intelligence
  def begin_guessing(game_obj)
    @counter == 1 ? first_guess : make_decisions(game_obj)
  end

  def log_game(feedback)
    @game_log[0] << @guess_array
    @game_log[1] << feedback
  end

  def first_guess
    [1, 1, 1, 1]
  end

  def make_decisions(game_obj)
    game_obj.hit_count > 0 ? increment_partially : increment_whole_array
  end

  # @game_log = [[[1, 1, 1, 1], [2, 2, 2, 2], [2, 3, 3, 3]], %w[0B0P 1B0P]]

  def increment_partially(hit_count)
    hit_elements = @game_log[0].last.take[hit_count]
    increment_value = hit_elements.last + 1
    @guess_array << hit_elements
    @guess_array << (4 - hit_count).times(increment_value)
  end

  def increment_whole_array
    @game_log[0].last.map { |last_guess| last_guess + 1 }
  end
end
