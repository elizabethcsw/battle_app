#Model
class Player
  attr_reader :name, :game

  def initialize(name, game = Game.new)
    @name = name
    @game = game
  end

end
