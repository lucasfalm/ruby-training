# frozen_string_literal: true

module Helpers
  module CommonTraversal
    private

    #
    # NOTE: dequeue_strategy_block(queue) -> Node - /graphs/v3/node.rb
    #
    def common_traversal(initial_node, destination_node, &dequeue_strategy_block)
      validate_common_traversal!(initial_node, destination_node)

      visited = {}
      queue   = [initial_node]
      result  = false

      while queue.any?
        puts "current queue -> #{queue.map(&:name).join(', ')}"

        #
        # NOTE: the dequeue_strategy_block is the main difference between BFS and DFS
        #
        current_node = dequeue_strategy_block.call(queue)

        next if visited.key?(current_node.name)

        visited[current_node.name] = true

        if current_node == destination_node
          result = true
          break
        end

        current_node.edges.each do |edge|
          queue << edge unless visited.key?(edge.name)
        end
      end

      visited_message = "visited: #{visited.keys.join(', ')}"

      if result
        "found! #{visited_message}"
      else
        "unreachable from #{initial_node.name} to #{destination_node.name}, visited: #{visited_message}"
      end
    end

    def validate_common_traversal!(initial_node, destination_node)
      puts "\nfrom #{initial_node.name} to #{destination_node.name} \n\n"

      unless initial_node && destination_node
        raise "invalid initial or destination node"
      end
    end
  end
end
