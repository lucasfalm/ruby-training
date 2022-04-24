# frozen_string_literal: true

module V2
  class Node

    attr_reader :value
    attr_accessor :edges_list, :color

    def initialize(value:)
      @value      = value
      @edges_list = []
      @color      = nil
    end

    def connect(node)
      edges_list      << node
      node.edges_list << self
      self
    end

    def list_adjacent_nodes
      edges_list
    end

    def is_connected?(node)
      !!edges_list.find { |edge_node| edge_node === node }
    end
  end
end
