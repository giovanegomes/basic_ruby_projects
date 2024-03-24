VALID_POSITIONS = (0..8).to_a;

class Board
  attr_reader :size, :locations

  def initialize
    @size = 3
    @locations = Array.new(9, nil);
  end

  def render
    system("clear")
    puts "################### TIC TAC TOE ###################"
    puts
    locations.each_slice(size).with_index do |row, index|
      puts "---------" if index != 0        
      puts row.map {|item| symbol item}.join(" | ")
    end
    puts
  end

  def win?
    board_array = locations.each_slice(size).map {|row| row}
    
    #rows
    board_array.map do |slice|
      row = slice.compact
      return row.first if winning_row?(row)
    end

    # #columns
    board_array.transpose.map do |slice|
      row = slice.compact
      return row.first if winning_row?(row)
    end

    # primary diagonal
    primary_row = []
    size.times.map do |index|
      primary_row << board_array[index][index]
    end
    return primary_row.first if winning_row?(primary_row) 

    # secondary diagonal
    secondary_row = []
    size.times do |index|
      diagonal_index = (size * (index+1)) - (index+1)
      secondary_row << locations[diagonal_index]
    end
    return secondary_row.first if winning_row?(secondary_row) 

    false
  end

  def winning_row?(row)
    row.length == size && row.all?{ |value| value == row.first }
  end

  def draw?
    locations.none?(nil) && !win?
  end

  def symbol(location)
    location&.symbol || " "
  end

  def valid_input?(input)
    if !VALID_POSITIONS.include?(input)
      puts "Invalid input, choose a spot from 1 to 9."
      return false
    end

    if !self.avaliable?(input)
      puts "That spot is already taken, choose other."
      return false
    end
    
    true
  end

  def set_spot(location, player)
    locations[location] = player
  end

  private

  def avaliable?(location)
    locations.at(location).nil?
  end
end