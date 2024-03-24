require_relative "tic-tac-toe"

puts "################### TIC TAC TOE ###################"
game = TicTacToe.new
game.initialize_players
game.play