require "pry-byebug"
require "colorize"

# This is player class
class Player
  attr_accessor :name, :sign, :victor

  def initialize(name)
    @name = name
    @victor = false
    @sign = ""
  end

  protected

  def declare_victory(name)
    name.victor = true
    "#{@name} has won!"
  end
end

# This is game class
class TicTacToe
  attr_accessor :log_history

  def initialize_game
    initialize
    @log_history = [[], []]
    create_new_board
  end

  def set_players
    puts "Welcome to Tic Tac Toe...".blue
    puts "Before we begin, let the first player type out their First name.".blue
    player1 = gets.chomp
    @player1 = Player.new(player1)
    show_porcessing
    puts "Great, hi #{@player1.name}! You're the player-1 for this game.".yellow
    puts "Now, player-2, pls introduce yourself by typing out your First name.".blue
    player2 = gets.chomp
    @player2 = Player.new(player2)
    initialize_game
    puts "Great, #{@player2.name}! You're the player-2 for this game.".yellow
  end

  def end_game(victor)
    puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ".green
    puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ".green
    puts "Congratulations #{victor.name}!! You're victorious!".green
    puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ".green
    puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ".green
    victor.victor = true
    @log_history = [[], []]
  end

  def alot_sign
    show_porcessing
    puts "Player-1 gets to choose the sign.".blue
    puts "What sign would you like to choose: x or o?".blue
    input = gets.chomp
    if %w[x o].include?(input)
      @player1.sign = input
      @player2.sign = if @player1.sign == "x"
                        "o"
                      else
                        "x"
                      end
    else
      show_porcessing
      puts "You seem to have made some mistake.".red
      puts "Make sure you're typing downcase x or downcase o.".red
      puts "Let's try again...".red
      return alot_sign
    end
    show_porcessing
    puts "Great! #{@player1.name} has chosen #{@player1.sign}. So, #{@player2.name} gets #{@player2.sign}!".yellow
  end

  def create_new_board
    @board = { 1 => "*", 2 => "*", 3 => "*", 4 => "*", 5 => "*", 6 => "*", 7 => "*", 8 => "*", 9 => "*" }
  end

  def update_log(player, position)
    @log_history[0] << player
    @log_history[1] << position
  end

  def count_round
    @log_history[1].size + 1
  end

  def update_board(key)
    @board[key] = current_player.sign
  end

  def loop_game
    play_round until @player1.victor == true || @player2.victor == true
  end

  def display_board
    puts "The latest board position:".blue
    puts "123 | #{@board[1]} #{@board[2]} #{@board[3]}"
    puts "456 | #{@board[4]} #{@board[5]} #{@board[6]}"
    puts "789 | #{@board[7]} #{@board[8]} #{@board[9]}"
    puts "--------------------------------------------".blue
  end

  def orient_board
    show_porcessing
    puts "Our game is set!".blue
    puts "The Tic-Tac-Toe board has nine spaces.".blue
    puts "Each player will point out where they want to mark their sign.".blue
    puts "Look at the tic-tac board's numbering on the left:".blue
    puts "123 | #{@board[1]} #{@board[2]} #{@board[3]}"
    puts "456 | #{@board[4]} #{@board[5]} #{@board[6]}"
    puts "789 | #{@board[7]} #{@board[8]} #{@board[9]}"
    puts "---------------------------------------------".blue
    puts "---------------------------------------------".blue
    puts "Let's take an example"
    show_porcessing
    puts "If a player wants to mark the center of the board".blue
    puts "the player should input number 5 when prompted".blue
    puts "That would result in the board indicating their sign.".blue
    puts "For example, if the player's sign is x:".blue
    puts "123 | #{@board[1]} #{@board[2]} #{@board[3]}"
    puts "456 | #{@board[4]} x #{@board[6]}"
    puts "789 | #{@board[7]} #{@board[8]} #{@board[9]}"
    puts "---------------------------------------------".blue
  end

  def current_player
    if @log_history[0].empty?
      @player1
    elsif @log_history[0].size == 1
      @player2
    else
      @log_history[0][-2]
    end
  end

  def play_round
    puts "Round: #{count_round}".yellow
    current_player = current_player()
    puts "#{current_player.name}'s turn.".yellow
    input = get_input
    update_board(input)
    update_log(current_player, input)
    display_board
    check_victory if count_round > 4
  end

  def get_input
    puts "Where do you want to put your sign?".blue
    puts "Just input the number and hit Enter.".blue
    input = gets.chomp.to_i
    if (1..9).cover?(input)
      if @log_history[1].include?(input)
        puts "Can't mark that position, it is already marked. Choose an available position.".red
        return get_input
      end
    else
      puts "You entered a position out of range. It should be between 1 to 9. And should be available for marking.".red
      puts "Let's try again..".red
      puts "-------------------------------".red
      return get_input
    end
    input
  end

  # rubocop:disable Metrics
  def check_victory
    victory_combo = [
      [@board[1], @board[2], @board[3]],
      [@board[4], @board[5], @board[6]],
      [@board[7], @board[8], @board[9]],
      [@board[1], @board[4], @board[7]],
      [@board[2], @board[5], @board[8]],
      [@board[3], @board[6], @board[9]],
      [@board[1], @board[5], @board[9]],
      [@board[3], @board[5], @board[7]]
    ]
    result = victory_combo.select do |element|
      element.none?("*") && element.all?(element[0])
    end
    find_victor unless result.empty?
  end

  # rubocop:enable Metrics

  def find_victor
    victor = @log_history[0].last
    end_game(victor)
  end

  def show_porcessing
    puts "."
    sleep 1
    puts ".."
    sleep 1
    puts "..."
  end
end

new_game = TicTacToe.new
new_game.initialize_game # Initializes the board
new_game.set_players # Sets player names
new_game.alot_sign
new_game.orient_board
new_game.loop_game
