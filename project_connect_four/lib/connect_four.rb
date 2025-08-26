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
    @columns = { col1: [], col2: [], col3: [], col4: [], col5: [], col6: [], col7: [] }
    @complete = false
  end

  def loop_game
    play_game until @complete == true
  end

  def play_game
    if game_log.empty?
      puts show_welcome
      puts show_rules
    end
    ask_to_play
    game_log[1] << take_input
    game_log[0] << current_player
    update_selected_column
    display_game_board
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
    if game_log[0].size.odd?
      "It is player-2's turn. Choose a column to drop your sprite."
    else
      "It is player-1's turn. Choose a column to drop your sprite."
    end
  end

  def take_input
    input = gets.chomp.to_i
    return input if input.between?(1, 7) && check_column_capacity(input)

    puts "Wrong input, pls provide your input again."
    take_input
  end

  def check_column_capacity(input)
    column = @columns[:"col#{input}"]
    column.size < 6 if column
  end

  def current_player
    return @player2 if game_log[0].size.odd?

    @player1
  end

  def update_selected_column
    # Take the last values from the game_log
    case game_log[1].last
    when 1
      @columns[:col1] << game_log[0].last.sign
    when 2
      @columns[:col2] << game_log[0].last.sign
    when 3
      @columns[:col3] << game_log[0].last.sign
    when 4
      @columns[:col4] << game_log[0].last.sign
    when 5
      @columns[:col5] << game_log[0].last.sign
    when 6
      @columns[:col6] << game_log[0].last.sign
    when 7
      @columns[:col7] << game_log[0].last.sign
    end
  end

  def display_game_board
    puts "   +---+---+---+---+---+---+---+"
    puts "   | #{@columns[:col1][5] || ' '} | #{@columns[:col2][5] || ' '} | #{@columns[:col3][5] || ' '} | #{@columns[:col4][5] || ' '} | #{@columns[:col5][5] || ' '} | #{@columns[:col6][5] || ' '} | #{@columns[:col7][5] || ' '} |"
    puts "   +---+---+---+---+---+---+---+"
    puts "   | #{@columns[:col1][4] || ' '} | #{@columns[:col2][4] || ' '} | #{@columns[:col3][4] || ' '} | #{@columns[:col4][4] || ' '} | #{@columns[:col5][4] || ' '} | #{@columns[:col6][4] || ' '} | #{@columns[:col7][4] || ' '} |"
    puts "   +---+---+---+---+---+---+---+"
    puts "   | #{@columns[:col1][3] || ' '} | #{@columns[:col2][3] || ' '} | #{@columns[:col3][3] || ' '} | #{@columns[:col4][3] || ' '} | #{@columns[:col5][3] || ' '} | #{@columns[:col6][3] || ' '} | #{@columns[:col7][3] || ' '} |"
    puts "   +---+---+---+---+---+---+---+"
    puts "   | #{@columns[:col1][2] || ' '} | #{@columns[:col2][2] || ' '} | #{@columns[:col3][2] || ' '} | #{@columns[:col4][2] || ' '} | #{@columns[:col5][2] || ' '} | #{@columns[:col6][2] || ' '} | #{@columns[:col7][2] || ' '} |"
    puts "   +---+---+---+---+---+---+---+"
    puts "   | #{@columns[:col1][1] || ' '} | #{@columns[:col2][1] || ' '} | #{@columns[:col3][1] || ' '} | #{@columns[:col4][1] || ' '} | #{@columns[:col5][1] || ' '} | #{@columns[:col6][1] || ' '} | #{@columns[:col7][1] || ' '} |"
    puts "   +---+---+---+---+---+---+---+"
    puts "   | #{@columns[:col1][0] || ' '} | #{@columns[:col2][0] || ' '} | #{@columns[:col3][0] || ' '} | #{@columns[:col4][0] || ' '} | #{@columns[:col5][0] || ' '} | #{@columns[:col6][0] || ' '} | #{@columns[:col7][0] || ' '} |"
    puts "   +---+---+---+---+---+---+---+"
    puts "     1   2   3   4   5   6   7 "
  end
end
