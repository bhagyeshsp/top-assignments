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
      expect(new_game.game_rule).to receive(:puts).exactly(3).times
    end
  end

  describe "asks players to take turn" do
    context "when the game has just begun" do
      it "asks the player1 to take their turn" do
      end
      it "records player1's move" do
      end
    end
    context "during the game play" do
      it "asks player2 to take turn if player1 had played the last turn" do
      end
    end
  end

  describe "displays updated game-board after each turn" do
    context "when the player1 takes the first turn" do
      it "displays player1's sprite in their chosen column's bottom" do
      end
    end

    context "during the gameplay" do
      it "displays stacked sprites after a player's turn" do
      end
    end
  end

  describe "when a column is full" do
    it "raises and error and asks the player to choose another column" do
    end
  end

  describe "when a player's sprite is in winning pattern" do
    context "the pattern is vertical" do
      it "announces the winner" do
      end
    end

    context "the pattern is horizontal" do
      it "announces the winner" do
      end
    end

    context "the pattern is diagonal" do
      it "announces the winner" do
      end
    end
  end

  describe "when no player's sprite is in winning pattern" do
    it "continues the game play" do
    end
  end
end
