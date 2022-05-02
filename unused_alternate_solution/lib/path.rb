require_relative 'grid'
require_relative 'bot'
require_relative 'princess'

class Path
  def self.displayPathtoPrincess(n, grid)

    grid = Grid.new(n, grid.join)
    bot = Bot.new(grid.bot_coords)
    princess = Princess.new(grid.princess_coords)

    until [bot.r, bot.c] == [princess.r, princess.c]
      if bot.r < princess.r
        bot.update_move_history('DOWN')
        bot.update_coords([bot.r + 1, bot.c])
      elsif bot.r > princess.r
        bot.update_move_history('UP')
        bot.update_coords([bot.r - 1, bot.c])
      elsif bot.c < princess.c
        bot.update_move_history('RIGHT')
        bot.update_coords([bot.r, bot.c + 1])
      elsif bot.c > princess.c
        bot.update_move_history('LEFT')
        bot.update_coords([bot.r, bot.c - 1])
      end
    end

    bot.move_history.each { |move| puts move }
    return bot.move_history
  end

  def self.nextMove(n, r, c, grid)
    grid = Grid.new(n, grid.join)
    bot = Bot.new([r, c])
    princess = Princess.new(grid.princess_coords)

    if [bot.r, bot.c] == [princess.r, princess.c]
      puts 'Bot found princess.'
      return bot.move_history
    end

    if bot.r < princess.r
      bot.update_move_history('DOWN')
      bot.update_coords([bot.r + 1, bot.c])
    elsif bot.r > princess.r
      bot.update_move_history('UP')
      bot.update_coords([bot.r - 1, bot.c])
    elsif bot.c < princess.c
      bot.update_move_history('RIGHT')
      bot.update_coords([bot.r, bot.c + 1])
    elsif bot.c > princess.c
      bot.update_move_history('LEFT')
      bot.update_coords([bot.r, bot.c - 1])
    end

    puts bot.move_history.last
    return bot.move_history.last
  end
end
