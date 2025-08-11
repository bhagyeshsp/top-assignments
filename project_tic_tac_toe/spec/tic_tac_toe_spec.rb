require_relative "../lib/tic_tac_toe"

describe TicTacToe do
  # For the flow of the methods in this class, I'm referring to the main.rb file
  # Because it is responsible for orchestrating the game
  # I will be testing only the 1st and 2nd degree of methods invoked by it
  describe "#initialize_game" do
    # If #initialization method only creates instance variables, no need to test
    # BUT this method additionally commands other method -> create_new_method
    # So, needs to be tested
  end

  describe "#set_players" do
    # This is a Public Comand method
    # Needs to be tested
  end

  describe "#alot_sign" do
    # This is a Public Command method
    # Needs to be tested
  end

  describe "#orient_board" do
    # This method only contains puts statements
    # No need to test
  end

  describe "#loop_game" do
    # This is a Public Loop method
    # Need to be tested
  end

  describe "#play_round" do
    # This is a Public Loop method
    # Need to be tested
  end

  describe "#count_round" do
    # This is a Public Query method
    # Need to be tested
  end

  describe "#current_player" do
    # This is a Public Query method
    # Need to be tested
  end

  describe "#get_input" do
    # This is a Public Command method
    # Need to be tested
  end

  describe "#update_board" do
    # This is a Public Command method
    # Need to be tested
  end

  describe "#update_log" do
    # This is a Public Command method
    # Need to be tested
  end

  describe "#display_board" do
    # This method cotnains puts statements
    # No need to test
  end

  describe "#check_victory" do
    # This method is a Public Query method
    # Needs to be tested
  end

  describe "#declar_draw" do
    # This method contains puts statements
    # No need to test
  end
end
