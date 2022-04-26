# frozen_string_literal: true

require 'byebug'

def count_connected_pieces(grid, blank_symbol: 'W')
  visited          = []
  counter          = 0
  connected_pieces = []

  grid.each.with_index do |row, i|
    row.each.with_index do |symbol, j|
      current_position = [i, j]

      next if visited.include?(current_position)

      if symbol != blank_symbol
        connected_pieces << explore_around(
          start_position:  current_position,
          already_visited: visited,
          grid:            grid,
          blank_symbol:    blank_symbol
        )
      else
        visited << current_position 
      end
    end
  end

  puts "CONNECTED PIECES ARE -> #{connected_pieces}"
  puts "CONNECTED PIECES SIZE -> #{connected_pieces.size}"
  puts "LARGEST CONNECTION -> #{connected_pieces.map(&:size).max}"
  puts "SMALLEST CONNECTION -> #{connected_pieces.map(&:size).min}"
end

# NOTE: BFS algorithm;
# 
def explore_around(start_position:, already_visited:, grid:, blank_symbol:)
  grid_position         = start_position.first(2)
  stack                 = [grid_position]
  connected_pieces      = []

  while(stack.size > 0)
    current_position = stack.pop

    next if already_visited.include?(current_position)

    already_visited << current_position

    i, j             = current_position
    current_row      = grid[i]

    next if current_row.nil?

    current_symbol = current_row[j]

    next unless current_symbol.is_a?(String)
    next if current_symbol === blank_symbol

    connected_pieces << current_position

    move_one!(
      i:               i,
      j:               j,
      stack:           stack,
      already_visited: already_visited,
    )
  end

  connected_pieces
end

def move_one!(i:, j:, stack:, already_visited:)
  # NOTE: up, down, left, right;
  # 
  [0, 1, 2, 3].each do |position_counter|
    case position_counter
    when 0
      new_j        = j + 1
      new_position = [i, new_j]

      stack << new_position unless already_visited.include?(new_position)
    when 1
      new_j        = j - 1
      next unless new_j.positive?

      new_position = [i, new_j]

      stack << new_position unless already_visited.include?(new_position)
    when 2
      new_i        = i + 1
      new_position = [new_i, j]

      stack << new_position unless already_visited.include?(new_position)
    when 3
      new_i        = i - 1
      next unless new_i.positive?

      new_position = [new_i, j]
      stack << new_position unless already_visited.include?(new_position)
    end
  end
end

grid = [
  # 0    1    2    3    4
  ['W', 'L', 'W', 'W', 'W'], # 0
  ['W', 'L', 'W', 'W', 'W'], # 1
  ['W', 'W', 'W', 'W', 'W'], # 2
  ['W', 'W', 'L', 'L', 'W'], # 3
  ['W', 'W', 'W', 'L', 'W'], # 4
  ['W', 'L', 'L', 'W', 'W']  # 5
]

count_connected_pieces(grid, blank_symbol: 'W')