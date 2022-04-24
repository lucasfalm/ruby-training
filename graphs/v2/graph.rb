# frozen_string_literal: true

require 'byebug'

module V2
  class Graph

    attr_accessor :nodes

    def initialize(nodes)
      @nodes            = nodes
      @internal_details = {
        bipartite: true
      }

    end

    def add(node)
      nodes << node

      node.connect(self)

      internal_details[:bipartite] = true
    end

    def is_bipartite?
      visited = []

      nodes.each do |node|
        assign_legal_coloring(node, visited) if !visited.include?(node) && internal_details[:bipartite]

        break if !internal_details[:bipartite]
      end

      internal_details[:bipartite]
    end

    def execute_bipartite_challenge
      if is_bipartite?
        red  = nodes.select { |node| node.color == 'red' }.map(&:value)
        blue = nodes.select { |node| node.color == 'blue' }.map(&:value)

        puts "red team: #{red}"
        puts "blue team: #{blue}"

        [red, blue]
      else
        puts "not possible to make two teams"

        false
      end
    end

    private

    attr_accessor :internal_details

    def assign_legal_coloring(start_node, visited)
      # NOTE: commented because this is not a normal DFS
      #       we have to check whether the start_node has the same color being
      #       assigned, to garantee that this graph is a bipartite;
      # 
      # return if visited.include?(start_node)

      visited << start_node

      if start_node.color.nil?
        start_node.color = 'red'
      end

      start_node.list_adjacent_nodes.each do |adjacent_node|
        if can_assign_legal_color?(adjacent_node, visited)
          adjacent_node.color = start_node.color == 'red' ? 'blue' : 'red'

          assign_legal_coloring(adjacent_node, visited)
        else
          break internal_details[:bipartite] = false if adjacent_node.color == start_node.color 
        end
      end
    end

    def can_assign_legal_color?(node, visited)
      !visited.include?(node)
    end
  end
end
