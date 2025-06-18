# This is intelligence module for computer player
module Intelligence
  def begin_guessing(game_obj)
    game_obj.counter == 1 ? first_guess : make_decisions(game_obj)
  end

  def first_guess
    [1, 1, 1, 1]
  end

  def make_decisions(game_obj)
    case game_obj.hit_count
    when 0
      increment_whole_array(game_obj.game_log)
    when 1, 2, 3
      increment_partially(game_obj.hit_count,
                          game_obj)
    when 4
      shuffle_guess(game_obj)
    else
      puts "Problem in make_decisions."
    end
  end

  def increment_partially(hit_count, game_obj)
    retain_elements = game_obj.game_log[0].last.take(hit_count)
    game_obj.guess_array << retain_elements
    increment_value = find_increment_value(game_obj)
    (4 - hit_count).times { game_obj.guess_array << increment_value }
    game_obj.guess_array.flatten!
  end

  def increment_whole_array(game_log)
    game_log[0].last.map { |last_guess| last_guess + 1 }
  end

  def find_increment_value(game_obj)
    last_increment_value = game_obj.game_log[0].last.last
    if last_increment_value <= 5
      last_increment_value + 1
    else
      last_increment_value
    end
  end

  def shuffle_guess(game_obj)
    puts "shuffling now.."
    game_obj.counter.even? ? game_obj.game_log[0].last.shuffle : game_obj.game_log[0].last.rotate(2)
  end
end
