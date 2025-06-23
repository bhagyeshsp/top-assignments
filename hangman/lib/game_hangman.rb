require "colorize"

require_relative "dictionary"
require_relative "play_logic"
# This class contains hangman game play objects
class Hangman
  include Dictionary
  include PlayLogic

  attr_reader :counter

  def initialize
    @secret_word = ""
    @correct_entries = []
    @incorrect_entries = []
    @current_arr = []
    @counter = 0
    @game_status = ""
  end

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
    loop_game
  end

  def loop_game
    until @game_status == "won" || @game_status == "lost"
      @counter += 1
      puts "#{@counter}/#{@secret_word.length} attempts left".yellow
      user_input = take_input
      if check_past_entries(user_input)
        @counter -= 1
        puts "\tYou've already played that letter. Guess some other letter."
        next
      else
        puts provide_feedback(user_input, @secret_word)
        puts "\t#{reveal_matching_chr(user_input, @secret_word, @current_arr)}"
        puts "\t#{display_incorrect_entries}"
      end
      check_victory
    end
  end

  protected

  attr_accessor :secret_word, :correct_entries, :incorrect_entries, :current_string, :game_status
end

# new_obj = Hangman.new
new_game = Hangman.new
new_game.play_game
