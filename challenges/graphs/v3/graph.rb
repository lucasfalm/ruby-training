require './challenges/graphs/v3/helpers/print.rb'
require './challenges/graphs/v3/helpers/bfs.rb'
require './challenges/graphs/v3/helpers/dfs.rb'
require './challenges/graphs/v3/helpers/dijkstra.rb'

class Graph
  include Helpers::Print
  include Helpers::BFS
  include Helpers::DFS
  include Helpers::Dijkstra

  attr_reader :nodes, :nodes_hash

  #
  # NOTE: nodes = [Node - /graphs/v3/node.rb]
  #
  def initialize(nodes = [])
    @nodes      = nodes
    @nodes_hash = nodes.map { |node| [node.name, node] }.to_h

    super
  end
end
