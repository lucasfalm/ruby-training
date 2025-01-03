# frozen_string_literal: true

module GridMethods
  module Print
    private

    def print_connected_pieces(connected_pieces)
      puts "CONNECTED PIECES ARE -> #{connected_pieces}"
      puts "CONNECTED PIECES SIZE -> #{connected_pieces.size}"
      puts "LARGEST CONNECTION -> #{connected_pieces.map(&:size).max}"
      puts "SMALLEST CONNECTION -> #{connected_pieces.map(&:size).min}"
    end
  end
end
