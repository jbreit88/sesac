class Bot

  attr_reader :x,
              :y

  def initialize(coords)
    @x = coords[0]
    @y = coords[1]
  end
end
