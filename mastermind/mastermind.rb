require_relative "board"

class MasterMind
  attr_reader :board, :guess_limit, :guess_count
  
  def initialize
    @board = Board.new
    @guess_limit = 12
    @guess_count = 0
  end

  def play
    until (board.win? || reach_guess_limit?) do
      try_guess
      board.render
      @guess_count += 1
    end

    if (board.win?)
      puts "Congratulations! You won!"
    else
      puts "You lose!"
    end
  end

  def try_guess
    loop do
      puts "Enter a code of four colors choosing from the following options separated by a comma:"
      puts "S, R, G, B, Y, O, P, W"

      code = gets.chomp.split(",").map do |value|
        value.strip.upcase
      end

      if board.valid_input?(code)
        board.set_guess(code)
        break
      end
    end
  end

  def reach_guess_limit?
    @guess_limit <= @guess_count
  end
end