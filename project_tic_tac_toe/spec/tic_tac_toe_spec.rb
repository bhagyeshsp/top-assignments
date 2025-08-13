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
    xit "sends a message to #create_new_board method" do
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

    xit "creates player1 instance object and sets the value of its name instance variable" do
      expect(player1).to receive(:name).and_return("John").once
      new_game.set_players
    end

    xit "creates player2 instance object and sets the value of its name instance variable" do
      expect(player2).to receive(:name).and_return("Kane").once
      new_game.set_players
    end

    xit "calls #initialize_game method" do
      expect(new_game).to receive(:initialize_game).once
      new_game.set_players
    end
  end

  describe "#alot_sign" do
    # This is a Public Command method
    # Needs to be tested
    let(:player1) { instance_double(Player) }
    let(:player2) { instance_double(Player) }

    context "when player1 is asked to choose their sign" do
      before do
        # ? Since we are using instance_double, we will have to allow ALL method calls on doubles during this method
        # ? This keeps everything tight and standalone
        allow(new_game).to receive(:gets).and_return("x", "o")
        new_game.instance_variable_set(:@player1, player1)
        new_game.instance_variable_set(:@player2, player2)
        allow(player1).to receive(:sign).and_return("x")
        allow(player2).to receive(:sign).and_return("o")
        allow(player1).to receive(:sign=).and_return("x")
        allow(player2).to receive(:sign=).and_return("o")
        allow(player1).to receive(:name).and_return("x")
        allow(player2).to receive(:name).and_return("o")
      end

      it "it alots 'o' to player2 if player1 chooses 'x'" do
        expect(player2).to receive(:sign).and_return("o")
        new_game.alot_sign
      end

      xit "it alots 'x' to player2 if player1 chooses 'o'" do
        # Since the 'x' -> 'o' test worked, no need to test 'o' -> 'x'
      end
    end
  end

  describe "#orient_board" do
    # This method only contains puts statements
    # No need to test
  end

  describe "#loop_game" do
    # This is a Public Loop method
    # Need to be tested
    # ? We only need to check whether the loop stops calling play_round
    # ? if it meets one of the three conditions
    let(:player1) { instance_double(Player) }
    let(:player2) { instance_double(Player) }
    before do
      new_game.instance_variable_set(:@player1, player1)
      new_game.instance_variable_set(:@player2, player2)
      allow(new_game).to receive(:play_round)
    end

    context "when none of the conditions are met, the loop continues" do
      it "continues execution when all conditions are false" do
        # ? Note that we have added second return value of true to player1 call
        # ? This will make sure that when the loop is executed second time, it will get short-circuited
        allow(player1).to receive(:victor).and_return(false, true)
        allow(player2).to receive(:victor).and_return(false)
        allow(new_game).to receive(:count_round).and_return(5)
        expect(new_game).to receive(:play_round).at_least(:once)
        new_game.loop_game
      end
    end

    context "when any of the conditions are met, the loop stops" do
      it "stops calling #play_round when player1 is victor" do
        # Interestingly, we don't need to setup receive for other two conditions
        # Because while evaluating from left-to-right, the code short-circuits
        # due to the first expression evaluating to true
        allow(player1).to receive(:victor).and_return(true)
        expect(new_game).to_not receive(:play_round)
        new_game.loop_game
      end

      it "stops calling #play_round when player2 is victor" do
        # Here, we are mocking player1 to receive :victor too
        # The reason is that while evaluating conditions
        # The loop_game will go from left-to-right
        allow(player1).to receive(:victor).and_return(false)
        allow(player2).to receive(:victor).and_return(true)
        expect(new_game).to_not receive(:play_round)
        new_game.loop_game
      end

      it "stops calling #play_round when #count_round returns 10" do
        # Here, we will have to mock both player1 and player2 to receive false
        # Because the loop_game will evaluate them before reaching the last condition
        allow(player1).to receive(:victor).and_return(false)
        allow(player2).to receive(:victor).and_return(false)
        expect(new_game).to receive(:count_round).and_return(10)
        new_game.loop_game
      end
    end
  end

  describe "#play_round" do
    # This is a Public Script method
    # No need to test
  end

  describe "#count_round" do
    # This is a Public Query method
    # Need to be tested
    let(:player1) { instance_double(Player) }
    let(:player2) { instance_double(Player) }

    it "returns 5 when the log_history[1].size is 4" do
      history = [[player1, player2, player1, player2], [1, 2, 3, 4]]
      new_game.instance_variable_set(:@log_history, history)
      expect(new_game.count_round).to eq(5)
    end
  end

  describe "#current_player" do
    # This is a Public Query method
    # Need to be tested
    let(:player1) { instance_double(Player) }
    let(:player2) { instance_double(Player) }

    context "when the log_history's player array is empty" do
      before do
        history = [[], []]
        new_game.instance_variable_set(:@log_history, history)
        new_game.instance_variable_set(:@player1, player1)
      end
      it "returns player1 object" do
        expect(new_game.current_player).to eq(player1)
      end
    end

    context "when the log_history's player array has only one entry" do
      before do
        history = [[player1], [1]]
        new_game.instance_variable_set(:@log_history, history)
        new_game.instance_variable_set(:@player1, player1)
        new_game.instance_variable_set(:@player2, player2)
      end

      it "returns player2 object" do
        expect(new_game.current_player).to eq(player2)
      end
    end

    context "when the log_history's player array has more than one entries" do
      # ? In examples of this context, note that we haven't setup new_game's instance variables @player1 and @player2
      # ? The reason behind is simple: the actual code in this condition doesn't look for instance variable.
      # ? Instead, it looks for `@log_history[0][-2]`.
      # ? Hence, the value is directly pulled from the array instead of checking with the new_game object's instance variable
      it "returns the second-last player object regardless of array's size, e.g.size = 2" do
        history = [[player1, player2], [1, 2]]
        new_game.instance_variable_set(:@log_history, history)
        expect(new_game.current_player).to eq(player1)
      end

      it "returns the second-last player object regardless of array's size, e.g.size = 4" do
        history = [[player1, player2, player1, player2], [1, 2, 3, 4]]
        new_game.instance_variable_set(:@log_history, history)
        expect(new_game.current_player).to eq(player1)
      end
    end
  end

  describe "#get_input" do
    # This is a Public Command method
    # Need to be tested
    # The conditions we need to test:

    it "prints relevant error if the user input is already played" do
      history = [%w[player1 player2], [1, 2]]
      new_game.instance_variable_set(:@log_history, history)
      error = "\e[0;31;49mCan't mark that position, it is already marked. Choose an available position.\e[0m"
      allow(new_game).to receive(:puts)
      allow(new_game).to receive(:gets).and_return("2", "3")

      new_game.get_input

      expect(new_game).to have_received(:puts).with(error).once
    end

    it "prints relevant error if the user input is out of 1..9 range" do
      history = [%w[player1 player2], [1, 2]]
      new_game.instance_variable_set(:@log_history, history)

      error = "\e[0;31;49mYou entered a position out of range. It should be between 1 to 9. And should be available for marking.\e[0m"
      allow(new_game).to receive(:puts)
      allow(new_game).to receive(:gets).and_return("10", "3")
      new_game.get_input
      expect(new_game).to have_received(:puts).with(error).once
    end

    it "converts user's input to Integer Type when it is legitimate" do
      history = [%w[player1 player2], [1, 2]]
      new_game.instance_variable_set(:@log_history, history)

      allow(new_game).to receive(:puts)
      allow(new_game).to receive(:gets).and_return("3")
      expect(new_game.get_input).to eq(3)
    end
  end

  describe "#update_board" do
    # This is a Public Command method
    # Need to be tested
    let(:player1) { double(sign: "x") }
    it "updates the value of the provided cell with the player's sign" do
      board_hash = { 1 => "*", 2 => "*", 3 => "*", 4 => "*", 5 => "*", 6 => "*", 7 => "*", 8 => "*", 9 => "*" }
      new_game.instance_variable_set(:@board, board_hash)
      allow(new_game).to receive(:current_player).and_return(player1)
      allow(player1).to receive(:sign).and_return("x")
      expect { new_game.update_board(1) }.to change { board_hash[1] }.from("*").to("x")
    end
  end

  describe "#update_log" do
    # This is a Public Command method
    # Need to be tested
    it "adds the player name and their move to the log_history instance variable" do
      log_history = [%w[player1 player2], [1, 2]]
      new_game.instance_variable_set(:@log_history, log_history)
      expect { new_game.update_log("player1", 3) }.to change { log_history[0].last }.from("player2").to("player1")
    end
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
