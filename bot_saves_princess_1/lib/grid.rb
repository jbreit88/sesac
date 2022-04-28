require 'enumerator'
require 'matrix'

class Grid

  attr_reader :size,
              :board

  def initialize(size, input)
    @size   = size
    @board  = input
    @matrix = to_matrix
  end

  def to_matrix
    nested_array = []
    @board.gsub(/\n/, '').chars.each_slice(@size) { |e| nested_array << e }

    matrix = Matrix[*nested_array]
  end

  def locate_princess
    @matrix.find_index('p')
  end

  def locate_bot
    @matrix.find_index('m')
  end
end
