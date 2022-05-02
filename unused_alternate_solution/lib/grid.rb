require 'enumerator'
require 'matrix'

class Grid

  attr_reader :size,
              :board

  def initialize(size, grid_string)
    @size   = size
    @board  = to_matrix_array(grid_string)
    @matrix = to_matrix
  end

  # Takes in the user input grid_string and creates a 2D nested array.
  def to_matrix_array(grid_string)
    nested_array = []
    grid_string.gsub(/\n/, '').chars.each_slice(@size) { |e| nested_array << e }

    nested_array
  end

  def to_matrix
    matrix = Matrix[*@board]
  end

  def princess_coords
    @matrix.find_index('p')
  end

  def bot_coords
    @matrix.find_index('m')
  end
end
