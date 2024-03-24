require_relative "player"
require_relative "board"

class TicTacToe
  attr_reader :board, :players 
  attr_accessor :current_player

  def initialize()
    @board = Board.new
    @players = []
  end

  def initialize_players
    1.upto(2) do |order|
      symbol = order == 1 ? 'X' : 'O'
      puts "-> Enter player #{order} name:"
      name = gets().chomp
      players << Player.new(name, symbol)
    end
  end

  def play
    if players.length != 2
      raise StandardError, "Two players are required to play Tic Tac Toe"
    end

    @current_player = players.first
    board.render

    until (board.win? || board.draw?) do
      choose_spot
      board.render
      switch_player
    end

    if (winner = board.win?)
      puts "Congratulations #{winner.name}!! You won!"
    else
      puts "It was a draw!"
    end
  end

  private

  def choose_spot
    loop do
      puts "-> Player #{current_player.name}, choose a free spot: [1 - 9]"
      location = gets().chomp.to_i
      location_index = location - 1

      if board.valid_input?(location_index)
        board.set_spot(location_index, current_player)
        break
      end
    end
  end

  def switch_player
    @current_player = current_player == players.first ? players.last : players.first
  end
end

TicTacToe.new