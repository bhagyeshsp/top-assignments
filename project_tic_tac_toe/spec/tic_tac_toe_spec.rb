require_relative "../lib/tic_tac_toe"
require_relative "../lib/player"

describe TicTacToe do
  # For the flow of the methods in this class, I'm referring to the main.rb file
  # Because it is responsible for orchestrating the game
  # I will be testing only the 1st and 2nd degree of methods invoked by it
  subject(:new_game) { described_class.new }

  describe "#initialize_game" do
    # If #initialization method only creates instance variables, no need to test
    # BUT this method additionally commands other method -> create_new_method
    # So, needs to be tested
    context "when a new game is initialized"
    it "sends a message to #create_new_board method" do
      expect(new_game).to receive(:create_new_board).once
      new_game.initialize_game
    end
  end

  describe "#set_players" do
    # This is a Public Comand method
    # Needs to be tested
    context "when setting up players names at the start of the game"
    let(:player1) { instance_double(Player, name: "John") }
    let(:player2) { instance_double(Player, name: "Kane") }

    before do
      allow(new_game).to receive(:gets).and_return("John", "Kane")
      allow(Player).to receive(:new).and_return(player1, player2)
    end

    it "creates player1 instance object and sets the value of its name instance variable" do
      expect(player1).to receive(:name).and_return("John").once
      new_game.set_players
    end

    it "creates player2 instance object and sets the value of its name instance variable" do
      expect(player2).to receive(:name).and_return("Kane").once
      new_game.set_players
    end

    it "calls #initialize_game method" do
      expect(new_game).to receive(:initialize_game).once
      new_game.set_players
    end
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
