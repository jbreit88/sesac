require 'matrix'
require 'enumerator'

class PathToPrincess

  def self.displayPathtoPrincess(n,grid)
    matrix = grid_to_matrix(n, grid)
    princess_coords = find_princess(matrix)
    bot_coords = find_bot(matrix)
    bot_movement = []

    until bot_coords[0] == princess_coords[0] && bot_coords[1] == princess_coords[1]
      if bot_coords[0] < princess_coords[0]
        bot_movement << 'DOWN'
        bot_coords[0] += 1
      elsif bot_coords[0] > princess_coords[0]
        bot_movement << 'UP'
        bot_coords[0] -= 1
      elsif bot_coords[1] < princess_coords[1]
        bot_movement << 'RIGHT'
        bot_coords[1] += 1
      elsif bot_coords[1] > princess_coords[1]
        bot_movement << 'LEFT'
        bot_coords[1] -= 1
      end
    end

    puts "Path to Princess:"
    bot_movement.each { |dir| puts dir}
  end

  def self.user_input
    $stdin.gets.chomp
  end

  def self.get_user_inputs
    puts 'Please input a whole, odd number greater than 3 and less than 100 for a grid size.'

    m = user_input.to_i

    # Check user input is greater than 2, less than 100, odd, and an integer
    until m.integer? && m.odd? && m >= 3 && m < 100
      puts 'That is not a whole, odd number.'
      puts 'Please input a whole, odd number greater than 3 and less than 100 for a grid size.'
      m = user_input.to_i
    end

    # Create a grid using the grid size input by user
    grid = make_grid(m)
  end

  def self.make_grid(grid_size)
    grid = ""
    row_number = 1

    puts "Please enter '-' for empty space, 'm' for the bot, and 'p' for princess."
    puts "Be sure your input matches your grid size."

    (0...grid_size).each do |i|
      puts "Row number #{row_number} of #{grid_size}:"
      grid << gets.strip
      row_number += 1
    end

    # Error handling for grid input: check character input, placement of princess, and placement of bot.
    if wrong_number_chars?(grid_size, grid)
      puts "Please only use one princess, one bot, and fill remaining spaces with '-'."
      make_grid(grid_size)
    elsif princess_not_in_corner?(grid_size, grid)
      puts 'Please put the princess in a corner.'
      make_grid(grid_size)
    elsif bot_not_in_center?(grid_size, grid)
      puts 'Please put the bot in the center.'
      make_grid(grid_size)
    else
      displayPathtoPrincess(grid_size, grid)
    end
  end

  # Error handling helper methods:
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

  def self.princess_not_in_corner?(grid_size, grid)
    matrix = grid_to_matrix(grid_size, grid)
    princess_coords = find_princess(matrix)

    if !corners(grid_size).include?(princess_coords)
      return true
    end

    return false
  end

  def self.bot_not_in_center?(grid_size, grid)
    if find_bot(grid_to_matrix(grid_size, grid)) != find_center_coords(grid_size)
      return true
    end

    return false
  end

  # Board creation
  def self.grid_to_matrix(n, grid)
    nested_array = []

    grid.gsub(/\n/, '').chars.each_slice(n) { |e| nested_array << e }

    matrix = Matrix[*nested_array]
  end

  # Define coordinates helper methods
  def self.find_princess(matrix)
    matrix.find_index('p')
  end

  def self.find_bot(matrix)
    matrix.find_index('m')
  end

  def self.corners(grid_size)
    [[0,0], [0, grid_size - 1], [grid_size - 1, 0], [grid_size - 1, grid_size - 1]]
  end

  def self.find_center_coords(grid_size)
    [x_coord = (grid_size - 1) /2,
    y_coord = (grid_size - 1) /2]
  end
end
