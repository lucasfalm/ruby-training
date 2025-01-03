# frozen_string_literal: true

require_relative 'grid_methods/print'
require_relative 'grid_methods/count_connected_pieces/bfs'
require_relative 'grid_methods/count_connected_pieces/dfs'

class Grid
  include GridMethods::CountConnectedPieces::BFS
  include GridMethods::CountConnectedPieces::DFS
  include GridMethods::Print

  attr_accessor :matrix

  def initialize(matrix = [[]])
    @matrix = matrix
  end
end
