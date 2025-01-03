# frozen_string_literal: true

module Helpers
  module CommonTraversal
    private

    #
    # NOTE: dequeue_strategy_block(queue) -> Node
    #
    def common_traversal(initial_node, destination_node, &dequeue_strategy_block)
      puts "\nfrom #{initial_node.name} to #{destination_node.name} \n\n"

      unless initial_node && destination_node
        return unreachable_message(initial_node, destination_node)
      end

      visited = {}
      queue   = [initial_node]
      result  = false

      while queue.any?
        puts "current queue -> #{queue.map(&:name).join(', ')}"

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

      puts "\n"

      if result
        "found! visited: #{visited.keys.join(', ')}"
      else
        "#{unreachable_message(initial_node, destination_node)}, visited: #{visited.keys.join(', ')}"
      end
    end

    def unreachable_message(initial_node, destination_node)
      "unreachable from #{initial_node.name} to #{destination_node.name}"
    end
  end
end