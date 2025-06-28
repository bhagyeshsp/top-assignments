# This is MasterMind game class
class MasterMind
  attr_accessor :bagel_array, :counter, :game_log, :guess_array, :hit_count

  def initialize
    generate_code
    @counter = 0
    @solved_game = false
    @bagel_array = []
    @game_log = [[], []]
    @hit_count = 0
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
      @guess_array = []
      @guess_array = computer_player.begin_guessing(game_obj)
      feedback = create_feedback
      log_game(feedback)
      puts "\tGame Log: #{game_log}"
      check_victory unless @bagel_array.empty?
      print_feedback unless @solved_game == true
      @hit_count = calculate_hits(feedback)
    end
    p "this was the code: #{@code}"
  end

  def calculate_hits(feedback)
    feedback.chars.sum(&:to_i)
  end

  def log_game(feedback)
    @game_log[0] << @guess_array
    @game_log[1] << feedback
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
    # puts "\tThis is bagel array: #{@bagel_array}"
    "#{@bagel_array.length}B"
  end

  def analyze_picos
    numb_of_picos = @code.count { |element| @guess_array.include?(element) }
    numb_of_picos -= @bagel_array.length
    "#{numb_of_picos}P"
  end

  def create_feedback
    analyze_bagels + analyze_picos
  end

  def check_victory
    return unless @code.eql?(@guess_array)

    @solved_game = true
    puts "\n-----------------\n-----------------\nYou've solved it!\n-----------------\n-----------------\n"
  end

  def print_feedback
    puts "My feedback to your last guess:#{create_feedback}\n\n"
  end

  protected

  attr_reader :code
  attr_accessor :solved_game

  def generate_code
    @code = (1..6).to_a.sample(4)
  end
end
