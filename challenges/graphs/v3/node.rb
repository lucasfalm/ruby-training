# frozen_string_literal: true

class Node
  attr_accessor :name, :edges

  def initialize(name = "", edges = [])
    @name  = name
    @edges = edges
  end

  def add_edge(node)
    @edges << node
  end

  def remove_edge(node_name)
    edge = @edges.find { |e| e.name == node_name }

    @edges.delete(edge)

    edge
  end
end
