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

# This is human player class
class HumanPlayer
  attr_accessor :name, :win

  def initialize(name)
    @name = name
    @win = false
  end
end

# This is computer player class
class ComputerPlayer
  def initialize
    generate_code
    @counter = 0
    @solved_game = false
    @bagel_array = []
  end

  def play_game
    welcome_screen
    until @counter == 12 || @solved_game == true
      receive_guess
      create_feedback
      check_victory unless @bagel_array.empty?
      print_feedback
    end
    p "this was the code: #{@code}"
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

host = ComputerPlayer.new
host.play_game
