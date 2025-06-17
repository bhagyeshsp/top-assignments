# This is MasterMind game class
class MasterMind
  attr_accessor :counter

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

  def play_computer_guesser(game_obj)
    generate_manual_code
    computer_player = ComputerPlayer.new
    until @solved_game == true
      count_turns
      puts "This is turn no.#{@counter}"
      @guess_array = computer_player.begin_guessing(game_obj)
      feedback = create_feedback
      log_game(feedback)
      check_victory unless @bagel_array.empty?
      print_feedback
    end
    p "this was the code: #{@code}"
  end

  def hit_count
    create_feedback.chars.sum(&:to_i)
  end

  def choose_mastermind(player_name, game_obj)
    puts "\nHi #{player_name}, would you like to be the MasterMind?\nType \"y\" or \"n\" without quotes."
    choice = gets.chomp
    play_computer_guesser(game_obj) if choice == "y"
    play_human_guesser if choice == "n"
  end

  def generate_manual_code
    puts "\nInput your code here. It should be only four digits.\n"
    @code = gets.chomp.chars.map(&:to_i)
  end

  def count_turns
    @counter += 1
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
