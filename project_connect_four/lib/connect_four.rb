require_relative "player"
# This is a ConnectFour class
class ConnectFour
  attr_accessor :game_log

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @player1.sign = "o"
    @player2.sign = "x"
    @game_log = [[], []]
  end

  def play_game
    if game_log.empty?
      show_welcome
      show_rules
    end
    ask_to_play
    game_log[1] << take_input
    game_log[0] << current_player
  end

  def show_welcome
    "Welcome to the Connect Four game!"
  end

  def show_rules
    puts "this is rule number 1"
    puts "this is rule number 2"
    puts "this is rule number 3"
  end

  def ask_to_play
    if game_log.size.odd?
      "It is player-2's turn. Choose a column to drop your sprite."
    else
      "It is player-1's turn. Choose a column to drop your sprite."
    end
  end

  def take_input
    input = gets.chomp.to_i
    return input if input.between?(1, 7)

    puts "Wrong input, pls provide your input again."
    take_input
  end

  def current_player
    return @player2 if game_log[0].size.odd?

    @player1
  end
end
