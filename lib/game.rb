#Model
class Game
  attr_reader :hp

  DEFAULT_HP = 100

  def initialize(hp = DEFAULT_HP)
    @hp = hp
  end

  def attack(player)
    player.game.attacked
  end

  def attacked
    @hp -= 10
  end
end
