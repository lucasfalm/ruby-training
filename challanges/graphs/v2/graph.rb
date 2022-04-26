# frozen_string_literal: true

require 'byebug'

require_relative 'graph_methods/bfs'
require_relative 'graph_methods/dfs'
require_relative 'graph_methods/shortest_path'
require_relative 'graph_methods/bipartite'
require_relative 'graph_methods/print'

module V2
  class Graph
    include V2::GraphMethods::BFS
    include V2::GraphMethods::DFS
    include V2::GraphMethods::ShortestPath
    include V2::GraphMethods::Bipartite
    include V2::GraphMethods::Print

    attr_accessor :nodes

    def initialize(nodes)
      @nodes            = nodes
      @internal_details = {
        bipartite: true
      }
    end

    def add(node, connect_node: nodes.last)
      nodes << node

      connect_node.connect(node)

      internal_details[:bipartite] = true
    end

    private

    attr_accessor :internal_details
  end
end
