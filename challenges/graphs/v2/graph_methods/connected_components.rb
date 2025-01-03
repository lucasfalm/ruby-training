# frozen_strin_literal: true

module V2
  module GraphMethods
    module ConnectedComponents
      def connected_components_count
        count   = 0
        visited = []

        nodes.each do |node|
          if explore(start_node: node, visited: visited)
            count += 1
          end
        end

        puts "DFS search:"
        puts "-> CONNECTED COMPONENTS: #{count}"
        puts "-> PER GROUP: #{nodes_group.values.map(&:size)}"
        puts "-> COMPONENTS PER GROUP: #{nodes_group.values.map { |group| group.map(&:value) }}"
      end

      def largest_connected_component
        count       = 0
        nodes_group = {}
        visited     = []
        largest     = []

        nodes.each do |node|
          if explore_size(start_node: node, visited: visited, nodes_group: nodes_group, count: count)
            count += 1
          end
        end

        nodes_group.values.each do |group|
          largest = group if largest.size < group.size
        end

        puts "DFS search:"
        puts "-> LARGEST COMPONENT SIZE: #{largest.size}"
        puts "-> LARGEST COMPONENT GROUP: #{largest.map(&:value)}"
      end

      private

      def explore(start_node:, visited:)
        return false if visited.include?(start_node.value)

        visited << start_node.value

        start_node.list_adjacent_nodes.each do |node|
          explore(start_node: node, visited: visited)
        end

        true
      end

      def explore_size(start_node:, visited:, nodes_group:, count:)
        return false if visited.include?(start_node.value)

        visited << start_node.value

        nodes_group[count] ||= []
        nodes_group[count] << start_node

        start_node.list_adjacent_nodes.each do |node|
          explore_size(start_node: node, visited: visited, nodes_group: nodes_group, count: count)
        end

        true
      end
    end
  end
end
