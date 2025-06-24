# This module contains the game play logic for hangman game class
module PlayLogic
  def begin_game
    banner = `figlet "Hangman"`.red
    puts banner
    open_saved_game
  end

  def open_saved_game
    puts "Do you want to open a previously saved game?\nType 'y' to open\nOr type 'n' to proceed with a new game.".yellow
    user_choice = gets.chomp
    if user_choice == "y"
      resume_saved_game
    elsif user_choice == "n"
      puts "Great! Beginning a new game!".yellow
      show_processing
      play_game
    else
      puts "Pls check your input and try again.".red
    end
  end

  def resume_saved_game
    file_content = load_game
    new_game = Hangman.from_json(file_content.first)
    puts "Resuming the saved game now. Game obj: #{new_game}".blue
    show_processing
    banner = `figlet "Welcome back"`
    puts banner
    puts "\tGame details:\t\nAttempts made: #{new_game.counter}\nIncorrect entries: #{new_game.incorrect_entries.join(',')}\nLatest revealed letters: #{new_game.current_arr.join(' ')}"
    new_game.loop_game
  end

  def create_mask(secret_word)
    secret_word.gsub(/[a-z]/, "_").chars
  end

  def take_input
    puts "\n*****************************\nType your next guess letter and hit enter:".blue
    gets.chomp
  end

  def valid_input?(user_input)
    user_input.chomp.length == 1
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
      puts "\n********************\nYou've saved the man on death row!\n********************\n".green
    elsif @counter >= @secret_word.length
      @game_status = "lost"
      puts "\n********************\nYou've lost!\nThe secret word was '#{@secret_word}'.\n********************\n".red
    end
  end

  def show_processing
    puts "..".green
    sleep 1
    puts ".".green
    sleep 1
  end
end
