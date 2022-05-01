class Bot

  attr_reader :r,
              :c,
              :move_history

  def initialize(coords)
    @r = coords[0] #row coord
    @c = coords[1] #column coord
    @move_history = []
  end

  def update_r_coord(coord)
    @r = coord
  end

  def update_c_coord(coord)
    @c = coord
  end

  def update_move_history(move)
    @move_history << move
  end
end
