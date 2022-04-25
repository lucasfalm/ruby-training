# frozen_strin_literal: true

module V2
  module GraphMethods
    module TraversalSupport
      def push_adjacent_nodes(node:, visited:, data_structure:)
        adjacencies = node.list_adjacent_nodes

        adjacencies.each do |adjacent_node|
          next if visited.include?(adjacent_node.value)

          data_structure << adjacent_node
        end
      end
    end
  end
end
