class Player
  attr_accessor :name, :points

  attr_reader :points

  def initialize(name)
    @name = name
    @points = 3
  end

  def subtract_point
    @points -= 1
  end

end
