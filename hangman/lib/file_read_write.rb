# This module helps read and write game files for saving and loading
module SaveLoadGame
  def save_game(serialized_obj)
    f = File.open("saved_game.txt", "w")
    f.puts serialized_obj
    puts "Saved game to saved_game.txt!"
    f.close
  end

  def load_game
    fname = "saved_game.txt"
    File.readlines(fname)
  end
end
