# frozen_string_literal: true

module GridMethods
  module CountConnectedPieces
    module BFS
      def with_bfs_count_connected_pieces(blank_symbol: 'W')
        visited          = []
        connected_pieces = []

        matrix.each.with_index do |row, i|
          row.each.with_index do |symbol, j|
            current_position = [i, j]

            next if visited.include?(current_position)

            if symbol != blank_symbol
              connected_pieces << explore_around(
                start_position:  current_position,
                already_visited: visited,
                blank_symbol:    blank_symbol
              )
            else
              visited << current_position 
            end
          end
        end

        print_connected_pieces(connected_pieces)

        connected_pieces
      end

      private

      # NOTE: BFS algorithm;
      # 
      #       r, c = row, column
      #       Time O(rc)
      #       Space O(rc)
      # 
      def explore_around(start_position:, already_visited:, blank_symbol:)
        queue            = [start_position]
        connected_pieces = []

        while(queue.size > 0)
          current_position = queue.shift

          next if already_visited.include?(current_position)

          row_index, column_index = current_position

          next if out_of_bounds?(row_index, column_index)

          already_visited << current_position
          current_symbol   = matrix[row_index][column_index]

          next if current_symbol === blank_symbol

          connected_pieces << current_position

          explore_four_sides!(
            row_index:       row_index,
            column_index:    column_index,
            queue:           queue,
            already_visited: already_visited,
          )
        end

        connected_pieces
      end

      def out_of_bounds?(row_index, column_index)
        current_row = matrix[row_index]

        return true if current_row.nil?

        current_symbol = current_row[column_index]

        !current_symbol.is_a?(String)
      end

      def explore_four_sides!(row_index:, column_index:, queue:, already_visited:)
        seek_positions = [
          [row_index, column_index + 1], # right
          [row_index, column_index - 1], # left
          [row_index + 1, column_index], # down
          [row_index - 1, column_index]  # up
        ].freeze

        seek_positions.each do |position|
          new_row_index, new_column_index = position

          next unless new_column_index.positive?
          next unless new_row_index.positive?

          queue << position unless already_visited.include?(position)
        end
      end
    end
  end
end
