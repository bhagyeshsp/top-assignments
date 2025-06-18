# This is intelligence module for computer player
module Intelligence
  def begin_guessing(game_obj)
    game_obj.counter == 1 ? first_guess : make_decisions(game_obj)
  end

  def first_guess
    [1, 1, 1, 1]
  end

  def make_decisions(game_obj)
    if game_obj.hit_count > 0
      increment_partially(game_obj.hit_count,
                          game_obj)
    else
      increment_whole_array(game_obj.game_log)
    end
  end

  # @game_log = [[[1, 1, 1, 1], [2, 2, 2, 2], [2, 3, 3, 3]], %w[0B0P 1B0P]]
  # code = [5,6,5,6]
  # guess-1 = [1,1,1,1]
  # guess-2 = [2,2,2,2]
  # guess-3 = [3,3,3,3]
  # guess-4 = [4,4,4,4]
  # guess-5 = [5,5,5,5]
  #  feedback: 2B0P
  # guess-6 = [5,5,6,6]
  #  feedback: 2B2P (need to fix numb_of_picos method because it is not counting all values in case of duplicates in @code.)


  def increment_partially(hit_count, game_obj)
    # binding.pry
    hit_elements = game_obj.game_log[0].last.take(hit_count)
    game_obj.guess_array << hit_elements
    puts "\tHit Elements: #{hit_elements}"
    increment_value = find_increment_value(hit_elements)
    (4 - hit_count).times { game_obj.guess_array << increment_value }
    puts "\tGuess Erray: #{game_obj.guess_array}"
    game_obj.guess_array.flatten!
  end

  def increment_whole_array(game_log)
    game_log[0].last.map { |last_guess| last_guess + 1 }
  end

  def find_increment_value(hit_elements)
    if hit_elements.last < 6
      hit_elements.last + 1
    else
      hit_elements.last - 1
    end
  end
end
