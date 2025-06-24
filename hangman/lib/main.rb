require_relative "game_hangman"

# Game begins
# Load word dictionary
#   Read the file
#   Filter words between length 5 and 12
#   Randomly choose one word from the filtered collection
#   Assign the chosen word to secret word
# Begin obstufication of the word using underscrolls (_ _ _ _ _)
#   Form the blank string matching the secret word
# Display the blank string and letter count for the player
# The player guesses a letter
#   Validate the input
#     If valid, pass it for checking for a match
# The player's guess letter enters the matching process
#   If match is true
#     Find out the position(s) of the matching letter(s) in the secret word
#       Once position found, create the revealed string with letters revealed
#   If match is false
#     Add the letter to the incorrect guess list
#       Decrease the number of remaining attempts
# Display the matched string, incorrect guess list and remaining attempts
# Repeat until the match string == secret string OR remaining attempts == 0
#
# v2
# During each turn, offer player to save the game
#   If player chooses to save the game
#     Create a serialized game object and write to a save file
#   If not, continue the game
# While loading a new game, offer player to open a saved game
#   If player chooses to load a saved game
#     Open the saved game file
#     Load the game by unserializing the game data
#     Continue the game from where left off
#   If player does not want to load the game
#     Start a new game

new_game = Hangman.new
new_game.begin_game
