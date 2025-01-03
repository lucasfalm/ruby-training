# frozen_string_literal: true

require_relative 'node'

module V1
  class Graph
    def initialize
      @nodes = {}
    end

    def add_node(node)
      @nodes[node] = node
    end

    # Undirect graph O <-> O
    def add_edge(node1, node2)
      @nodes[node1].add_edge(@nodes[node2])
      @nodes[node2].add_edge(@nodes[node1])
    end

    def BFS(root_node, search_value)
      visited = []
      to_visit = []

      # add root node to visited list and to_visit queue
      visited << root_node
      to_visit << root_node

      until to_visit.empty?
        current_node = to_visit.shift
        if current_node.value == search_value
          puts "Found! Node #{current_node}, value of #{current_node.value} and adjacent nodes #{current_node.adjacent_nodes}"
          return current_node
        end

        current_node.adjacent_nodes.each do |node|
          unless visited.include?(node)
            visited << node
            to_visit << node
          end
        end
      end
    end
  end
end

n1 = V1::Node.new('a')
n2 = V1::Node.new('b')
n3 = V1::Node.new('c')
n4 = V1::Node.new('d')
n5 = V1::Node.new('e')
g = Graph.new
g.add_node(n1)
g.add_node(n2)
g.add_node(n3)
g.add_node(n4)
g.add_node(n5)
g.add_edge(n1, n2)
g.add_edge(n1, n3)
g.add_edge(n2, n3)
g.add_edge(n3, n4)
g.add_edge(n4, n5)
g.add_edge(n5, n3)
g.BFS(n1, 'b')
