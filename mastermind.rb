require "pry-byebug"

# There are total of 6 color pegs: 1,2,3,4,5,6
# There are two colored feedback pegs: B, P, F (Bagel, Pico, Fermi)
#   Bagel = black/red peg indicating that a color and its position right
#   Pico = white peg indicating a color is right
#   Fermi = blank holes indicating lack of right color and position
# The computer generates a random color code [1,1,2,3]
# The player begins his guessing: [1,1,1,1]
# The computer provides feedback: 2B0P
# The player adjusts his guess: [1,1,2,2]
# The computer provides feedback: 3B0P
# The player adjusts his guess: [1,1,2,3]
# The computer provides feedback: 4B
# You've won in 3 guesses!

# Variation-2
# Offer the human player to be a mastermind
#  if chose NO
#   play_human_guesser
#  if chose YES
#   play_computer_guesser
#    human generates manual code
#    computer makes first guess 1111
#    program provides feedback
#    computer makes second guess
#    program provides feedback
#    etc..etc..

# Variation-3: algorithmic computer guesser
# Human creates a code: [5,3,4,5]
# Computer begins guessing
#
#  Guess-1: [1,1,1,1]
#  Feedback: 0B0P
#  ~ hit or miss
#   ~ miss
#    ~ hit
#     ~ 4-hit target
#      ~ 4-B target by re-arrangement

# This is intelligence module for computer player
module Intelligence
  def begin_guessing
    @counter == 1 ? first_guess : make_decisions
  end

  def log_game
    @game_log[0] << @guess_array
    @game_log[1] << create_feedback
  end

  def first_guess
    [1, 1, 1, 1]
  end

  def make_decisions
    hit_count > 0 ? increment_partially : increment_whole_array
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

  def hit_count
    create_feedback.chars.sum(&:to_i)
  end
end

# This is human player class
class HumanPlayer
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# This is computer player class
class ComputerPlayer
  include Intelligence
  attr_accessor :name

  def initialize
    @name = %w[computron dave tars jarvis].sample
    @game_log = [[], []]
    puts "Created @name!\n"
  end

  def make_guess
    guess = (1..6).to_a.sample(4)
    puts "#{@name} guessed #{guess}\n\n"
    guess
  end
end

# This is MasterMind game class
class MasterMind
  def initialize
    generate_code
    @counter = 0
    @solved_game = false
    @bagel_array = []
  end

  def play_human_guesser
    welcome_screen
    until @counter == 12 || @solved_game == true
      receive_guess
      create_feedback
      check_victory unless @bagel_array.empty?
      print_feedback
    end
    p "this was the code: #{@code}"
  end

  def play_computer_guesser
    generate_manual_code
    computer_player = ComputerPlayer.new
    @counter = 0
    until @solved_game == true
      count_turns
      @guess_array = computer_player.make_guess
      create_feedback
      check_victory unless @bagel_array.empty?
      print_feedback
    end
    p "this was the code: #{@code}"
  end

  def choose_mastermind(player_name)
    puts "\nHi #{player_name}, would you like to be the MasterMind?\nType \"y\" or \"n\" without quotes."
    choice = gets.chomp
    play_computer_guesser if choice == "y"
    play_human_guesser if choice == "n"
  end

  def generate_manual_code
    puts "\nInput your code here. It should be only four digits.\n"
    @code = gets.chomp.chars.map(&:to_i)
  end

  def count_turns
    @counter += 1
    puts "This is turn no.#{@counter}"
  end

  def welcome_screen
    puts "\nWelcome to the MasterMind!\n\nWhen prompted, provide your guess with four digits.\nFor example, if your guess is 1234, type 1234\n and hit enter."
  end

  def receive_guess
    @counter += 1
    @bagel_array = []
    @guess_array = []
    puts "\n-----------------------------\nThis is your guess no.#{@counter}."
    guess = gets.chomp
    @guess_array = guess.chars.map(&:to_i)
  end

  def analyze_bagels
    i = 0
    arr = []
    while i <= 3
      arr << @code[i] if @code[i] == @guess_array[i]
      i += 1
    end
    @bagel_array = arr
    "#{@bagel_array.length}B"
  end

  def analyze_picos
    numb_of_picos = (@code.intersection(@guess_array) - @bagel_array).count
    "#{numb_of_picos}P"
  end

  def create_feedback
    analyze_bagels + analyze_picos
  end

  def check_victory
    @solved_game = true if @bagel_array.size == 4
    puts "You've solved it!" if @solved_game == true
  end

  def print_feedback
    puts "My feedback to your last guess:#{create_feedback}"
  end

  protected

  attr_reader :code
  attr_accessor :bagel_array, :counter, :solved_game

  def generate_code
    @code = (1..6).to_a.sample(4)
  end
end

game = MasterMind.new
human_player = HumanPlayer.new("Bhagyesh")
game.choose_mastermind(human_player.name)
