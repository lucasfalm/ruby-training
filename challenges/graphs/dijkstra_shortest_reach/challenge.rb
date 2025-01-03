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

# NOTE: https://www.hackerrank.com/challenges/dijkstrashortreach/problem?isFullScreen=true
# 
def shortest_reach(nodes_count, edges, start_node_value)
  nodes = {}

  nodes_count.times do |node_value|
    node_value += 1
    nodes[node_value] = Node.new(value: node_value)
  end

  edges.each do |node_a_value, node_b_value, weight|
    node_a = nodes[node_a_value]
    node_b = nodes[node_b_value]

    node_a.connect(
      node: node_b,
      cost: weight
    )
  end

  visited          = [false] * nodes_count
  start_weight     = 0
  search_value     = nodes.values.last.value
  stack            = [[start_node_value, start_weight]]
  back_track_stack = []
  backtracking     = false

  costs        = [-1] * nodes_count

  while stack.size.positive?
    current_value, current_weight = stack.pop

    next if visited[current_value - 1] && !backtracking

    if current_value == start_node_value && backtracking
      backtracking = false
    end

    unless backtracking
      visited[current_value - 1] = true
      back_track_stack          << [current_value, 0]
      current_cost               = costs[current_value - 1] 

      if current_cost == -1 || current_cost > current_weight
        costs[current_value - 1] = current_weight 
      end

      min_value  = nil
      min_weight = nil
      nodes[current_value].list_adjacent_nodes.each do |adjacent_node, adjacent_weight|
        next if visited[adjacent_node - 1]

        if min_weight.nil? || adjacent_weight < min_weight 
          min_value  = adjacent_node
          min_weight = adjacent_weight
        end
      end

      unless min_value.nil?
        next stack << [min_value, min_weight + current_weight]
      end

      if visited.count(false).positive? && back_track_stack.map(&:first).size != 1
        backtracking = true
        stack       << back_track_stack.pop
      end
    else
      stack << back_track_stack.pop
    end
  end

  print costs.filter { |cost| cost != 0 }
end

# NOTE: without normal backtrack, pushing directly to start instead (easiest backtrack);
# 
def shortest_reach_v2(nodes_count, edges, start_node_value)
  nodes = {}

  nodes_count.times do |node_value|
    node_value += 1
    nodes[node_value] = Node.new(value: node_value)
  end

  edges.each do |node_a_value, node_b_value, weight|
    node_a = nodes[node_a_value]
    node_b = nodes[node_b_value]

    node_a.connect(
      node: node_b,
      cost: weight
    )
  end

  visited          = [false] * nodes_count
  start_weight     = 0
  search_value     = nodes.values.last.value
  stack            = [[start_node_value, start_weight]]

  costs = [-1] * nodes_count

  while stack.size.positive?
    current_value, current_weight = stack.pop

    next if visited[current_value - 1]

    visited[current_value - 1] = true unless current_weight == 0
    current_cost               = costs[current_value - 1] 

    if current_cost == -1 || current_cost > current_weight
      costs[current_value - 1] = current_weight 
    end

    min_value  = nil
    min_weight = nil
    nodes[current_value].list_adjacent_nodes.each do |adjacent_node, adjacent_weight|
      next if visited[adjacent_node - 1] || adjacent_node == start_node_value

      if min_weight.nil? || adjacent_weight < min_weight 
        min_value  = adjacent_node
        min_weight = adjacent_weight
      end
    end

    unless min_value.nil?
      next stack << [min_value, min_weight + current_weight]
    end

    stack = [[start_node_value, start_weight]] if nodes[start_node_value].list_adjacent_nodes.any? { |adjacent_value, _weight| !visited[adjacent_value - 1] }
  end

  costs.filter { |cost| cost != 0 }
end

nodes_count      = 4
edges            = [[1, 2, 24], [1, 4, 20], [3, 1, 3], [4, 3, 12]]
start_node_value = 1

nodes_count      = 5
edges            = [[1, 2, 10], [1, 3, 6], [2, 4, 8]]
start_node_value = 1

shortest_reach(nodes_count, edges, start_node_value)
