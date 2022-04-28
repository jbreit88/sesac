class Grid

  attr_reader :size,
              :board

  def initialize(size, input)
    @size   = size
    @board  = input
  end

end
