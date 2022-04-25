# frozen_strin_literal: true

module V2
  module GraphMethods
    module ShortestPath
      # NOTE: DFS solution;
      # 
      def shortest_path_dfs(start_node:, destination:)
        stack             = [start_node]
        visited           = []
        distances         = []
        current_distance  = 0

        while stack.size > 0
          puts "dequeuing from stack -> #{stack.map(&:value)}"

          current_node = stack.pop

          next if visited.include?(current_node.value)

          puts "visiting node -> #{current_node.value}"
          current_distance += 1 unless current_node === start_node
          visited          << current_node.value

          puts "current distance -> #{current_distance}"
          puts "current visited -> #{visited}"

          if current_node.value == destination.value
            puts "destination found! current distance -> #{current_distance}"

            distances        << current_distance
            current_distance  = 0
            visited.delete(destination.value)

            next
          end

          current_node.list_adjacent_nodes.each do |adjacent_node|
            stack << adjacent_node if !visited.include?(adjacent_node.value)
          end
        end

        shortest_distance = distances.min
        puts "\ndistances calculated -> #{distances}"
        puts "shortest distance -> #{shortest_distance}"

        shortest_distance
      end

      # NOTE: BFS solution;
      # 
      def shortest_path_bfs(start_node:, destination:)
        queue             = [[start_node, 0]]
        visited           = []
        shortest_distance = nil

        while queue.size > 0
          puts "dequeuing from queue -> #{queue.map { |node, _distance| node.value }}"

          current_node, current_distance = queue.shift

          next if visited.include?(current_node.value)

          puts "visiting node -> #{current_node.value}"
          visited << current_node.value

          if current_node.value == destination.value
            puts "destination found! current distance -> #{current_distance}"

            shortest_distance = current_distance

            break
          end

          puts "current distance -> #{current_distance}"
          puts "current visited -> #{visited}"

          current_node.list_adjacent_nodes.each do |adjacent_node|
            # next if visited.include?(adjacent_node.value)
            queue << [adjacent_node, current_distance + 1]
          end
        end

        puts "shortest distance -> #{shortest_distance}"

        shortest_distance
      end
    end
  end
end
