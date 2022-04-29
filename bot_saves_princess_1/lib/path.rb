require 'grid'
require 'bot'
require 'princess'

class Path

  def initialize(n, grid)
    @grid = Grid.new(n, grid)
    @bot = Bot.new(@grid.locate_bot)
    @princess = Princess.new(@grid.locate_princess)
  end

  def display_path_to_princess


end
