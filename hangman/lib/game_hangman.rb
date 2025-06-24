require "colorize"
require "json"
require_relative "dictionary"
require_relative "play_logic"
require_relative "file_read_write"
# This class contains hangman game play objects
class Hangman
  include Dictionary
  include PlayLogic
  include SaveLoadGame

  attr_reader :counter

  # rubocop:disable Metrics
  def initialize(secret_word = "", correct_entries = [], incorrect_entries = [], current_arr = [], counter = 0,
                 game_status = "")
    @secret_word = secret_word
    @correct_entries = correct_entries
    @incorrect_entries = incorrect_entries
    @current_arr = current_arr
    @counter = counter
    @game_status = game_status
  end
  # rubocop:enable Metrics

  def display_incorrect_entries
    "Past incorrect entries: #{incorrect_entries.join(',')}"
  end

  def display_current_string
    current_string
  end

  def play_game
    lines = open_dictionary
    @secret_word = filter_lines(lines).sample(1).join
    puts "Secret word is: #{@secret_word}"
    @current_arr = create_mask(@secret_word)
    puts "Masked word is: #{@current_arr.join(' ')} with length #{@secret_word.length}".yellow
    @counter = 0
    loop_game
  end

  def loop_game
    until @game_status == "won" || @game_status == "lost"
      increment_counter
      display_attempt_status
      user_input = take_input
      if user_input == "1" # User wants to save the game
        initiate_saving(self)
        break
      end
      if valid_input?(user_input)
        if check_past_entries(user_input)
          decrement_counter
          puts "\tYou've already played that letter. Guess some other letter."
          next
        else
          display_game_status(user_input)
        end
      else
        puts "Pls provide a valid input, try again!"
        decrement_counter
        next
      end
      check_victory
    end
  end

  def to_json(*_args)
    JSON.dump({
                secret_word: @secret_word,
                correct_entries: @correct_entries,
                incorrect_entries: @incorrect_entries,
                current_arr: @current_arr,
                counter: @counter,
                game_status: @game_status
              })
  end

  def self.from_json(string)
    data = JSON.parse string
    new(data["secret_word"], data["correct_entries"], data["incorrect_entries"], data["current_arr"], data["counter"],
        data["game_status"])
  end

  protected

  attr_accessor :secret_word, :correct_entries, :incorrect_entries, :current_arr, :game_status
end

# new_game = Hangman.new
# new_game.play_game
# serialized = new_game.to_json
# puts serialized
# new_game.save_game(serialized)
# sleep 2
# p loaded_game_obj = new_game.load_game
# p Hangman.from_json(loaded_game_obj.first)

new_game = Hangman.new
new_game.begin_game
