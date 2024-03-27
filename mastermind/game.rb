require_relative "mastermind"

puts "================================ MASTERMIND =================================="
puts
puts "You have 12 turns to guess the secret code, which is a combination of four colors." 
puts "The Available colors are: S, R, G, B, Y, O, P, W."
puts "(Silver, Red, Green, Blue, Yellow, Orange, Purple, White)"
puts
puts "After each guess, you will receive the following feedback."
puts
puts "  - ●  means correct color in the correct position."
puts "  - ○  means correct color but in the wrong position."
puts "  - _  means incorrect color."
puts
puts "You have 10 attempts to crack the code. Have fun!"
puts
puts "=============================================================================="

game = MasterMind.new
game.play