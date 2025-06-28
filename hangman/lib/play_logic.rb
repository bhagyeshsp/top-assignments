# This module contains the game play logic for hangman game class
module PlayLogic
  def begin_game
    banner = `figlet "Hangman"`.red
    puts banner
    open_saved_game
  end

  def open_saved_game
    puts "Type 'y' to open a saved game\nType 'n' to proceed with a new game.".yellow
    user_choice = gets.chomp
    if user_choice == "y"
      show_processing
      puts "Great! Here's the list of previously saved games.\nTo select the game, type its index number and hit enter.".green
      display_game_list
    elsif user_choice == "n"
      puts "Great! Beginning a new game!".yellow
      show_processing
      play_game
    else
      puts "Pls check your input and try again.".red
    end
  end

  def resume_saved_game(selected_game)
    resumed_game = Hangman.from_json(selected_game)
    display_resume_screen(resumed_game)
    resumed_game.loop_game
  end

  def display_game_list
    game_list_arr = load_game
    game_list_arr.each.with_index do |game, idx|
      unserialized_game = Hangman.from_json(game)
      puts "index no:#{idx + 1} #{unserialized_game.show_game_entries}".blue
    end
    select_game(game_list_arr)
  end

  def show_game_entries
    "| Saved: #{@save_time}    | Player: #{@player} | Word length: #{@secret_word.length} | Attempts left: #{@counter}/#{@secret_word.length}"
  end

  def select_game(game_list_arr)
    selected_game_idx = gets.chomp.to_i
    selected_game = game_list_arr[selected_game_idx - 1]
    resume_saved_game(selected_game)
  end

  def display_resume_screen(game_obj)
    show_processing
    banner = `figlet "Welcome back"`
    puts banner
    puts "\tGame details:\n\tAttempts made: #{game_obj.counter}\n\tIncorrect entries: #{game_obj.incorrect_entries.join(',')}\n\tLatest revealed letters: #{game_obj.current_arr.join(' ')}\n\n"
  end

  def initiate_saving(game_obj)
    @counter -= 1
    @save_time = Time.now
    serialized_obj = game_obj.to_json
    save_game(serialized_obj)
    show_processing
    open_saved_game
  end

  def reset_game_parameters
    @counter = 0
  end

  def create_mask(secret_word)
    secret_word.gsub(/[a-z]/, "_").chars
  end

  def increment_counter
    @counter += 1
  end

  def decrement_counter
    @counter -= 1
  end

  def display_attempt_status
    puts "\n*****************************\nThis is attempt number #{@counter} of #{@secret_word.length}\n".green
  end

  def display_save_prompt
    puts "Note: to save the game, type 1.".red
  end

  def take_input
    puts "Type your next guess letter and hit enter:".blue
    gets.chomp
  end

  def valid_input?(user_input)
    user_input.chomp.length == 1
  end

  def display_game_status(user_input)
    puts provide_feedback(user_input, @secret_word)
    puts "\t#{reveal_matching_chr(user_input, @secret_word, @current_arr)}"
    puts "\t#{display_incorrect_entries}"
  end

  def provide_feedback(input_chr, secret_word)
    if secret_word.include?(input_chr)
      log_correct(input_chr)
      "\tWe have a match!".green
    else
      log_incorrect(input_chr)
      "\tOops, no match this time :(".red
    end
  end

  def reveal_matching_chr(input_chr, secret_word, current_arr)
    return current_arr.join(" ") unless secret_word.chars.any?(input_chr)

    modify_current_arr(input_chr, secret_word, current_arr)
  end

  def modify_current_arr(input_chr, secret_word, current_arr)
    index_arr = find_index(input_chr, secret_word)
    update_current_arr(index_arr, current_arr, input_chr)
    current_arr.join(" ")
  end

  def find_index(input_chr, secret_word)
    secret_word.chars.map.with_index { |v, idx| idx if v == input_chr }.compact!
  end

  def update_current_arr(index_arr, current_arr, input_chr)
    index_arr.each { |element| current_arr[element] = input_chr }
  end

  def log_correct(correct_chr)
    @correct_entries << correct_chr
  end

  def log_incorrect(incorrect_chr)
    @incorrect_entries << incorrect_chr
  end

  def check_past_entries(input_chr)
    @correct_entries.include?(input_chr) || @incorrect_entries.include?(input_chr)
  end

  def check_victory
    if @current_arr == @secret_word.chars
      @game_status = "won"
      banner = `figlet "You're the saviour!"`.green
      puts banner
      puts "\n********************\nYou've saved the man on death row!\n********************\n".green
    elsif @counter >= @secret_word.length
      @game_status = "lost"
      banner = `figlet "Loser!"`.red
      puts banner
      puts "\n********************\nThe man has died!\nThe secret word was '#{@secret_word}'.\n********************\n".red
    end
  end

  def show_processing
    puts "..".green
    sleep 1
    puts ".".green
    sleep 1
  end
end
