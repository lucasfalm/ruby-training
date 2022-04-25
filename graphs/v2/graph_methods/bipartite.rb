# frozen_strin_literal: true

module V2
  module GraphMethods
    module Bipartite
      # NOTE: a bipartite graph is a graph where the number of
      #       nodes can be splited equally by two by color.
      #       the two sets are nodes not connected to nodes of the same color.
      #       
      def is_bipartite?
        visited = []

        nodes.each do |node|
          assign_legal_coloring(node, visited) if !visited.include?(node.value) && internal_details[:bipartite]

          break if !internal_details[:bipartite]
        end

        puts "DFS search (bipartite):"
        puts "-> VISITED NODES: #{visited}"
        puts "-> IS BIPARTITE? #{internal_details[:bipartite]}"

        internal_details[:bipartite]
      end

      def execute_bipartite
        if is_bipartite?
          red  = nodes.select { |node| node.color == 'red' }.map(&:value)
          blue = nodes.select { |node| node.color == 'blue' }.map(&:value)

          puts "red group: #{red}"
          puts "blue blue: #{blue}"

          [red, blue]
        else
          puts "not possible to make two equal sets"

          false
        end
      end

      private

      def assign_legal_coloring(start_node, visited)
        # NOTE: commented because this is not a normal DFS
        #       we have to check whether the start_node has the same color being
        #       assigned, to garantee that this graph is a bipartite;
        # 
        # return if visited.include?(start_node)

        visited << start_node.value

        if start_node.color.nil?
          start_node.color = 'red'
        end

        start_node.list_adjacent_nodes.each do |adjacent_node|
          if !visited.include?(adjacent_node.value)
            adjacent_node.color = start_node.color == 'red' ? 'blue' : 'red'

            assign_legal_coloring(adjacent_node, visited)
          else
            break internal_details[:bipartite] = false if adjacent_node.color == start_node.color 
          end
        end
      end
    end
  end
end
