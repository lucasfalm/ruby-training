# frozen_string_literal: true

class Node
  attr_accessor :name, :edges

  #
  # NOTE: edges = [Node - /graphs/v3/node.rb]
  #
  def initialize(name: "", weight: nil, edges: [])
    @name   = name
    @weight = weight
    @edges  = edges
  end

  def add_edge(node)
    @edges << node
  end

  def remove_edge(node)
    edge = @edges.find { |edge| edge.name == node.name }

    @edges.delete(edge)

    edge
  end
end
