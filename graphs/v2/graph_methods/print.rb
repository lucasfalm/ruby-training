# frozen_strin_literal: true

module V2
  module GraphMethods
    module Print
      def print
        nodes.each do |node|
          puts "NODE: #{node.value}"
          node.list_adjacent_nodes.each do |adjacent_node|
            puts "CONNECTS: #{adjacent_node.value}"
          end

          puts "\n"
        end

        nil
      end
    end
  end
end
