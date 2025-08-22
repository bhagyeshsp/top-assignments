require_relative "player"
# This is a ConnectFour class
class ConnectFour
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @player1.sign = "o"
    @player2.sign = "x"
  end

  def show_welcome
    "Welcome to the Connect Four game!"
  end

  def show_rules
    puts "this is rule number 1"
    puts "this is rule number 2"
    puts "this is rule number 3"
  end

  def play_game
    show_welcome
  end
end
