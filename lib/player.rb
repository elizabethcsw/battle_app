#Model
class Player
  attr_reader :name, :hp

  DEFAULT_HP = 100

  def initialize(name)
    @name = name
    @hp = DEFAULT_HP
  end

  def attack(player)
    player.attacked
  end

  def attacked
    @hp -= 10
  end
end
