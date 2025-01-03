# frozen_string_literal: true

require 'byebug'

require_relative 'grid'

matrix = [
  # 0    1    2    3    4
  ['L', 'W', 'W', 'W', 'L'], # 0
  ['W', 'W', 'L', 'W', 'L'], # 1
  ['W', 'W', 'L', 'L', 'L'], # 2
  ['W', 'W', 'W', 'W', 'W'], # 3
  ['W', 'W', 'W', 'W', 'W'], # 4
  ['W', 'W', 'W', 'W', 'W']  # 5
]

matrix = [
  # 0    1    2 
  ['L', 'W', 'W'], # 0
  ['W', 'W', 'W'], # 1
  ['W', 'W', 'W'], # 2
  ['W', 'W', 'W'], # 3
  ['W', 'W', 'L'], # 4
  ['W', 'W', 'W']  # 5
]

grid = Grid.new(matrix)

grid.with_bfs_count_connected_pieces(blank_symbol: 'W')
