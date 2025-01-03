#!/bin/ruby

require 'json'
require 'stringio'
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

# NOTE: https://www.hackerrank.com/challenges/johnland/problem?isFullScreen=true
# 
def roads_in_hacker_island(nodes_count, roads)
  nodes = {}

  nodes_count.times do |node_value|
    node_value       += 1
    nodes[node_value] = Node.new(value: node_value)
  end

  roads.each do |road|
    from, to, c = road
    cost        = 2 ** c
    nodes[from].connect(node: nodes[to], cost: cost)
  end

  distances = {}

  nodes.each do |start_node_value, node|
    visited     = []
    stack       = [[start_node_value, 0]]
    search_node = start_node_value + 1
    # byebug if start_node_value == 3
    break if search_node > nodes_count || start_node_value == nodes_count

    while stack.size.positive?
      break if search_node > nodes_count

      stack_node_value, stack_travel_cost = stack.pop

      key_from_start_to_current = "#{start_node_value}-#{stack_node_value}"

      next if visited.include?(stack_node_value)

      if stack_node_value != search_node
        visited << stack_node_value unless stack.select { |node, cost| node == stack_node_value && stack_travel_cost > cost }.any?
      end

      min_cost_from_start_to_found = distances.fetch("#{start_node_value}-#{search_node}", -1)

      if stack_travel_cost != 0
        if distances.key?(key_from_start_to_current)
          current_min_total_cost = distances[key_from_start_to_current]

          if stack_travel_cost <= current_min_total_cost
            distances[key_from_start_to_current] = stack_travel_cost
          end
        else
          distances["#{start_node_value}-#{stack_node_value}"] = stack_travel_cost
        end
      end

      min_cost_from_start_to_found = distances.fetch("#{start_node_value}-#{search_node}", -1)

      if min_cost_from_start_to_found.positive? && min_cost_from_start_to_found < stack_travel_cost
        search_node += 1
        visited      = []
        stack       << [start_node_value, 0]
      else
        if stack_node_value != search_node
          current_node = nodes[stack_node_value]

          current_node.list_adjacent_nodes.each do |adjacent_node_value, cost|
            if adjacent_node_value != start_node_value

              if !stack.include?([adjacent_node_value, cost + stack_travel_cost])
                stack << [adjacent_node_value, cost + stack_travel_cost]

                if visited.include?(adjacent_node_value) && distances.fetch("#{start_node_value}-#{adjacent_node_value}", -1) >= cost + stack_travel_cost
                  visited.delete(adjacent_node_value)
                end
              end
            end
          end
        end
      end
    end
  end

  min_distances = {}

  distances.each do |from_to, distance|
    key_ordered   = from_to.split('-').sort.join('-')
    min_distances[key_ordered] = distance if !min_distances.key?(key_ordered) || min_distances[key_ordered] > distance
  end

  print (min_distances.values.sum).to_s(2)
end


n     = 5
roads = [
  [1, 3, 5],
  [4, 5, 0],
  [2, 1, 3],
  [3, 2, 1],
  [4, 3, 4],
  [4, 2, 2]
]

n = 7
roads = [
  [4, 3, 4],
  [2, 5, 3],
  [5, 7, 8],
  [5, 3, 1],
  [1, 2, 5],
  [7, 5, 6],
  [7, 4, 7],
  [6, 2, 9],
  [3, 2, 0],
  [7, 3, 2]
]

roads_in_hacker_island(n, roads)