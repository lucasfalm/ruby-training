# frozen_string_literal: true

module V1
  class Node
    attr_reader :value, :adjacent_nodes

    def initialize(value)
      @value          = value
      @adjacent_nodes = []
    end

    def add_edge(adjacent_node)
      adjacent_nodes << adjacent_node
    end
  end
end