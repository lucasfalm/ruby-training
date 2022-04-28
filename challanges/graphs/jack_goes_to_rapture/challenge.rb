# frozen_string_literal: true

require 'byebug'

class Node
  attr_reader :value, :undirected, :edges_list

  def initialize(value:, undirected: true)
    @value      = value
    @undirected = undirected
    @edges_list = {}
  end

  def connect(node:, cost:)
    return if edges_list.key?(node.value)

    edges_list[node.value] = cost

    node.connect(
      node: self,
      cost: cost
    ) if undirected

    self
  end

  def list_adjacent_nodes
    edges_list
  end
end

# NOTE: https://www.hackerrank.com/challenges/jack-goes-to-rapture/problem?isFullScreen=true
# 
def get_cost(nodes_count, g_from, g_to, g_weight)
  nodes = {}

  nodes_count.times do |node_value|
    node_value       += 1
    nodes[node_value] = Node.new(value: node_value)
  end

  creator_counter = 0
  while(creator_counter < g_from.size)
    node_value_a = g_from[creator_counter]
    node_value_b = g_to[creator_counter]

    nodes[node_value_a].connect(
      node: nodes[node_value_b],
      cost: g_weight[creator_counter]
    )

    creator_counter += 1
  end

  start_node = nodes.values.first
  search     = nodes.values.last

  travel_costs = []
  visited = []

  # DFS
  stack = [[start_node.value, 0, 0, 0]]

  while stack.size.positive?
    dequeued_value, dequeued_cost, travel_cost_index, previous_node_value = stack.pop

    next if visited.include?(dequeued_value)

    travel_costs[travel_cost_index] ||= []

    if dequeued_cost.positive? || dequeued_cost == 0
      travel_costs[travel_cost_index] << dequeued_cost
    else
      travel_costs[travel_cost_index] << 0
    end

    if dequeued_value == search.value
      # NOTE: starting a new travel;
      # 
      stack.map! do |stack_node|
        value, cost, cost_index, previous_node_value = stack_node

        [value, cost, cost_index + 1, previous_node_value]
      end

      next
    end

    current_values_on_stack = stack.map { |value, _cost, _cost_index| value }

    visited << dequeued_value if dequeued_value == start_node.value

    current_node = nodes[dequeued_value]
    current_node.list_adjacent_nodes.each do |adjacent_node_value, adjacent_node_cost|
      next if previous_node_value == adjacent_node_value
      next if visited.include?(adjacent_node_value)
      next if current_values_on_stack.include?(adjacent_node_value)

      real_cost_adjacent_node = adjacent_node_cost - travel_costs[travel_cost_index].sum

      stack << [
        adjacent_node_value,
        real_cost_adjacent_node,
        travel_cost_index,
        current_node.value
      ]
    end
  end

  print travel_costs.map(&:sum).min
end

# g_nodes  = 5
# g_from   = [1, 3, 1, 4, 2]
# g_to     = [2, 5, 4, 5, 3]
# g_weight = [60, 70, 120, 150, 80]

# g_nodes  = 4
# g_from   = [1, 1, 2, 3]
# g_to     = [2, 3, 4, 4]
# g_weight = [20, 5, 30, 40]

g_nodes  = 5
g_from   = [1, 2, 3, 4, 1, 3]
g_to     = [2, 3, 4, 5, 3, 5]
g_weight = [30, 50, 70, 90, 70, 85]

get_cost(g_nodes, g_from, g_to, g_weight)
