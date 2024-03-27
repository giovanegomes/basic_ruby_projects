class Board
  attr_reader :board, :secret

  COLORS = ["S", "R", "G", "B", "Y", "O", "P", "W"].freeze

  def initialize
    @board = Array.new
    @secret = COLORS.sample(4);
  end

  def render
    12.times do |index|
      if board[index].nil?
        puts ("  |   |   |  ") 
      else
        feedback = make_feedback(board[index])
        puts "#{board[index][:code].join(" | ")} - #{feedback.join(' ')}"
      end
    end
  end

  def valid_input?(input)
    valid_colors = input.all? { |option| COLORS.include?(option) }
    valid_size = input.length == 4

    unless valid_colors && valid_size
      puts "Invalid input, try again."
      return false
    end

    true
  end

  def set_guess(code)
    correct = code.filter { |color| secret.include?(color)}
    correct_in_place = code.each_with_index.reduce(0) do |acc, (current, index)|
      acc += 1 if secret[index] == current
      acc
    end
    correct_out_place = correct.length - correct_in_place
    incorrect = code.filter { |color| !secret.include?(color)}
    
    @board << {
      :code => code,
      :correct_in_place => correct_in_place,
      :correct_out_place => correct_out_place,
      :incorrect => incorrect.length,
    }
  end

  def win?
    return false if board.empty?

    board.last[:code].eql?(secret)
  end

  def make_feedback(guess)
    feedback = Array.new

    if (guess[:correct_in_place])
      (0...guess[:correct_in_place]).collect { feedback << '●'}
    end

    if (guess[:correct_out_place])
      (0...guess[:correct_out_place]).collect { feedback << '○'}
    end

    if (guess[:incorrect])
      (0...guess[:incorrect]).collect { feedback << '_'}
    end

    feedback
  end
end