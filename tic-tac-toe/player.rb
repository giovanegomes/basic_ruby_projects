class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name, @symbol = name, symbol
  end
end