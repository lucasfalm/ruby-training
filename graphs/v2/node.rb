# frozen_string_literal: true

module V2
  class Node

    attr_reader :value, :undirected
    attr_accessor :color

    def initialize(value:, undirected: true)
      @value      = value
      @undirected = undirected
      @edges_list = []
      @color      = nil
    end

    def connect(node)
      return self if edges_list.include?(node)

      edges_list << node

      node.connect(self) if undirected

      self
    end

    def list_adjacent_nodes
      edges_list
    end

    def is_connected?(node)
      !!edges_list.find { |edge_node| edge_node === node }
    end

    private

    attr_accessor :edges_list
  end
end
