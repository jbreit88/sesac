require_relative 'princess'
require_relative 'path'
require_relative 'bot'
require_relative 'grid'

def nextMove(n,r,c,grid)
  Path.nextMove(n,r,c,grid)
end

n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)
