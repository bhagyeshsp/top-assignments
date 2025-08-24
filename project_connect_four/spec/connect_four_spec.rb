require_relative "../lib/connect_four"

describe ConnectFour do
  describe "when game initiates" do
    subject(:new_game) { described_class.new }

    it "displays the welcome screen" do
      message = "Welcome to the Connect Four game!"
      result = new_game.show_welcome
      expect(result).to eq(message)
    end
    it "displays the game rules" do
      expect(new_game).to receive(:puts).exactly(3).times
      new_game.show_rules
    end
  end

  describe "asks players to take turn" do
    subject(:new_game) { described_class.new }

    context "when the game has just begun" do
      it "asks the player1 to take their turn" do
        message = "It is player-1's turn. Choose a column to drop your sprite."
        result = new_game.ask_to_play
        expect(result).to eq(message)
      end

      it "records player1's move" do
        allow(new_game).to receive(:take_input).and_return(3)
        new_game.play_game

        expect(new_game.game_log[1].first).to eq(3)
      end

      it "records player1's turn in game_log" do
        player1 = new_game.instance_variable_get(:@player1)
        allow(new_game).to receive(:take_input).and_return(5)
        new_game.play_game
        expect(new_game.game_log[0].first).to eq(player1)
      end
    end
    context "during the game play" do
      let(:player1) { instance_double(Player) }
      let(:player2) { instance_double(Player) }

      it "asks player1 to take turn if player2 had played the last turn" do
        log_history = [[player1, player2], [2, 3]]
        new_game.instance_variable_set(:@game_log, log_history)
        message = "It is player-1's turn. Choose a column to drop your sprite."
        expect(new_game.ask_to_play).to eq(message)
      end
    end
  end

  describe "updates the column with the player's sprite after his turn" do
    context "when the player1 takes the first turn" do
      it "updates player1's sprite in their chosen column's first position" do
      end
    end

    context "during the gameplay" do
      xit "updates a player's sprite on top the existing ones" do
      end
    end
  end

  describe "when a column is full" do
    xit "raises and error and asks the player to choose another column" do
    end
  end

  describe "when a player's sprite is in winning pattern" do
    context "the pattern is vertical" do
      xit "announces the winner" do
      end
    end

    context "the pattern is horizontal" do
      xit "announces the winner" do
      end
    end

    context "the pattern is diagonal" do
      xit "announces the winner" do
      end
    end
  end

  describe "when no player's sprite is in winning pattern" do
    xit "continues the game play" do
    end
  end
end
