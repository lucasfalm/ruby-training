require './challenges/graphs/v3/helpers/common_traversal.rb'

module Helpers
  module DFS
    include Helpers::CommonTraversal

    #
    # NOTE: initial_node & search_node = Node - /graphs/v3/node.rb
    #
    def dfs(initial_node: nodes.first, destination_node: nodes.last)
      common_traversal(initial_node, destination_node) do |queue|
        #
        # NOTE: LIFO (last in, first-out)
        #
        queue.pop
      end
    end
  end
end
