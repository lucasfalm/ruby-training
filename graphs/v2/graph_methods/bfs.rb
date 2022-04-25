# frozen_strin_literal: true

require_relative 'travesal_support'

module V2
  module GraphMethods
    module BFS
      include V2::GraphMethods::TraversalSupport

      # NOTE: breadth-first search;
      # 
      #       use a queue (first in, first out) to search,
      #       it means that we validate always all the adjacencies from
      #       the start node, to then validate the sub nodes from the adjacencies
      # 
      #       there is no way to use recursion;
      # 
      def bfs(start_node: nodes.first, destination: nodes.last)
        visited = []
        queue   = [start_node]
        result  = false

        while queue.length > 0
          dequeued_node = queue.shift

          next if visited.include?(dequeued_node.value)

          visited << dequeued_node.value

          break result = true if dequeued_node.value == destination.value

          push_adjacent_nodes(
            node:           dequeued_node,
            visited:        visited,
            data_structure: queue
          )
        end

        puts "BFS search:"
        puts "-> VISITED NODES: #{visited}"
        puts "-> FOUND NODE: #{result}"

        result
      end
    end
  end
end
