require 'matrix'
require 'enumerator'
require_relative 'bot'

class NextMove

  def self.nextMove(n,r,c,grid, bot = Bot.new([r, c]))
    bot_coords = [bot.r, bot.c].map { |e| e.to_i }
    princess_coords = find_princess(n, grid)

    if bot_found_princess?(bot_coords, princess_coords)
      puts "The bot has found the princess."
      puts "Here is your bot's full move history:"

      bot.move_history.each { |move| puts move}
      return
    end

    puts "Would you like to see the bot's next move? Y/n:"
    answer = user_input.downcase.strip

    until answer == 'y' || answer == 'n'
      puts 'That is not a valid input. Please input Y or N'
      answer = user_input.downcase.strip
    end

    if answer == 'y'
      if bot_coords[0] < princess_coords[0]
        puts 'DOWN'
        bot.update_r_coord(bot_coords[0] + 1)
        bot.update_move_history('DOWN')
        nextMove(n, r, c, grid, bot)
      elsif bot_coords[0] > princess_coords[0]
        puts 'UP'
        bot.update_r_coord(bot_coords[0] - 1)
        bot.update_move_history('UP')
        nextMove(n, r, c, grid, bot)
      elsif bot_coords[1] < princess_coords[1]
        puts 'RIGHT'
        bot.update_c_coord(bot_coords[1] + 1)
        bot.update_move_history('RIGHT')
        nextMove(n, r, c, grid, bot)
      elsif bot_coords[1] > princess_coords[1]
        puts 'LEFT'
        bot.update_c_coord(bot_coords[1] - 1)
        bot.update_move_history('LEFT')
        nextMove(n, r, c, grid, bot)
      end
    elsif answer == 'n'
      puts "Thank you for playing!"
      puts "Here is your bot's full move history:"

      bot.move_history.each { |move| puts move}
      return
    end
  end

  def self.user_input
    $stdin.gets.chomp
  end

  def self.get_user_inputs
    puts 'Please input a whole number greater than 1 and less than 100 for a grid size.'
    # User input for grid size
    n = user_input.to_i

    # Check user input is an integer greater than 1 (need at least 2x2 square) and less than 100
    until n.integer? && n > 1 && n < 100
      puts 'That is not a whole number between 1 and 100.'
      puts 'Please input a whole number greater than 1 and less than 100 for a grid size.'
      n = user_input.to_i
    end

    # User input for bot placement
    puts 'Please enter the row coordinate for the bot.'
    r = user_input
    valid_chars = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
    until valid_chars.include?(r) && r.to_i >= 0 && r.to_i <= n - 1
      puts 'That is not a valid row coordinate.'
      puts 'Please enter the row coordinate for the bot.'
      r = user_input
    end

    puts 'Please enter the column coordinate for the bot.'
    c = user_input

    until valid_chars.include?(c) && c.to_i >= 0 && c.to_i <= n - 1
      puts 'That is not a valid column coordinate.'
      puts 'Please enter the column coordinate for the bot.'
      c = user_input
    end

    bot_coords = [r, c]
    # Create a grid using the grid size input by user
    grid = make_grid(n, bot_coords)
  end

  def self.make_grid(grid_size, bot_coords)
    grid = ""
    row_number = 1

    puts "Please enter '-' for empty space, 'm' for the bot, and 'p' for princess."
    puts "Be sure your input matches your grid size."

    (0...grid_size).each do |i|
      puts "Row number #{row_number} of #{grid_size}:"
      grid << gets.strip
      row_number += 1
    end

    # Error handling for grid input: check character input, check that placement of bot in grid string matches coords provided by user, and check that princess and bot are not on the same spot.
    if wrong_number_chars?(grid_size, grid)
      puts "Please only use one princess, one bot, and fill remaining spaces with '-'."
      make_grid(grid_size, bot_coords)
    elsif bot_coords_not_match_grid?(grid_size, grid, bot_coords)
      puts "Please make a grid with bot at coordinates #{bot_coords[0]}, #{bot_coords[1]}."
      make_grid(grid_size, bot_coords)
    else
      nextMove(grid_size, bot_coords[0], bot_coords[1], grid)
    end
  end

  # Helper Methods
  def self.wrong_number_chars?(grid_size, grid)
    valid_chars = ['p', 'm', '-']

    grid.chars.each do |c|
      if !valid_chars.include?(c)
        return true
      end
    end

    if grid.length != grid_size * grid_size
      return true
    elsif grid.count('p') != 1
      return true
    elsif grid.count('m') != 1
      return true
    elsif grid.count('-') != (grid_size * grid_size) - 2
      return true
    end

    return false
  end

  def self.bot_coords_not_match_grid?(grid_size, grid, bot_coords)
    bot_coords = bot_coords.map { |e| e.to_i }
    matrix = grid_to_matrix(grid_size, grid)
    bot_coords_on_grid = find_bot(matrix)

    if bot_coords_on_grid != bot_coords
      return true
    end

    return false
  end

  def self.bot_found_princess?(bot_coords, princess_coords)
    if bot_coords == princess_coords
      return true
    else
      return false
    end
  end

  # Board creation
  def self.grid_to_matrix(n, grid)
    nested_array = []

    grid.gsub(/\n/, '').chars.each_slice(n) { |e| nested_array << e }

    matrix = Matrix[*nested_array]
  end

  # Define coordinates methods
  def self.find_bot(matrix)
    matrix.find_index('m')
  end

  def self.find_princess(grid_size, grid)
    matrix = grid_to_matrix(grid_size, grid)
    matrix.find_index('p')
  end

end
