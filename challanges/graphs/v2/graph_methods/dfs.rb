# frozen_strin_literal: true

require_relative 'travesal_support'

module V2
  module GraphMethods
    module DFS
      include V2::GraphMethods::TraversalSupport

      # NOTE: depth-first search;
      # 
      #       use a stack (last in, first out) to search,
      #       it means that we validate always one adjacency from
      #       the start node, then validate one sub node from the adjacency
      #       until we reach the end (depth);
      #
      #       can use recursion or a stack;
      # 
      def dfs(start_node: nodes.first, destination: nodes.last)
        visited = []
        stack   = [start_node]
        result  = false

        while stack.length > 0
          dequeued_node = stack.pop

          next if visited.include?(dequeued_node.value)

          visited << dequeued_node.value

          break result = true if dequeued_node.value == destination.value

          push_adjacent_nodes(
            node:           dequeued_node,
            visited:        visited,
            data_structure: stack
          )
        end

        puts "DFS search:"
        puts "-> VISITED NODES: #{visited}"
        puts "-> FOUND NODE: #{result}"

        result
      end
    end
  end
end
