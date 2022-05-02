class Bot

  attr_reader :r,
              :c,
              :move_history

  def initialize(coords)
    @r = coords[0]
    @c = coords[1]
    @move_history = []
  end

  def update_coords(coords_array)
    @r = coords_array[0]
    @c = coords_array[1]
  end

  def update_move_history(move)
    @move_history << move
  end
end
