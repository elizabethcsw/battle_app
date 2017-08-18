# Model
class Player
  attr_reader :name, :hp
  attr_accessor :attacked

  DEFAULT_HP = 100

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @hp = hp
  end

  def attacked
    @hp -= 10
  end
end
