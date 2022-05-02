require './lib/princess'
require './lib/path'
require './lib/bot'
require './lib/grid'

def displayPathtoPrincess(n, grid)
  Path.displayPathtoPrincess(n, grid)
end

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
  grid[i] = gets.strip
end

displayPathtoPrincess(m, grid)
