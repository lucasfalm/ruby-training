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

# NOTE: DFS with backtrack implemented;
# 

def generate_nodes(nodes_count, connected_from, connected_to, weight)
  nodes = {}

  nodes_count.times do |node_value|
    node_value       += 1
    nodes[node_value] = Node.new(value: node_value)
  end

  creator_counter = 0
  while(creator_counter < connected_from.size)
    node_value_a = connected_from[creator_counter]
    node_value_b = connected_to[creator_counter]

    nodes[node_value_a].connect(
      node: nodes[node_value_b],
      cost: weight[creator_counter]
    )

    creator_counter += 1
  end

  nodes
end

def get_cost_v2(nodes_count, connected_from, connected_to, weight)
  nodes       = generate_nodes(nodes_count, connected_from, connected_to, weight)
  start_node  = nodes.values.first
  search_node = nodes.values.last

  travel_costs = []
  visited = [false] * nodes_count

  start_weight    = 0
  start_index     = 0
  stack           = [[start_node.value, start_weight, start_index]]
  backtrack_stack = []
  backtracking    = false

  stack_log       = []
  travel_costs    = {}

  while stack.size.positive?
    current_value, current_cost, current_index = stack.pop

    if visited[current_index] && !backtracking
      unless backtracking

      end
    else
      current_node           = nodes[current_value]
      visited[current_index] = true

      if current_node.value == search_node.value
        backtracking = true
      end

      if !backtracking && current_node.value != start_node.value
        travel_cost_key               = "#{nodes[stack_log.last].value}<->#{current_value}"
        travel_costs[travel_cost_key] = current_cost
      end

      if current_node.value == start_node.value
        backtracking = false
      end

      backtrack_stack << [current_node.value, 0, 0] unless backtracking || current_node.value == search_node.value
      stack_log       << current_value

      if backtracking
        stack << backtrack_stack.pop
      else
        current_node.list_adjacent_nodes.each do |adjacent_value, adjacent_cost|
          stack << [adjacent_value, adjacent_cost - current_cost, adjacent_value - 1]
        end
      end
    end
  end

  byebug
  print travel_costs
end

# NOTE: applying dijkstra algorithm;
# 
def get_cost_v3(nodes_count, connected_from, connected_to, weight)
  nodes           = generate_nodes(nodes_count, connected_from, connected_to, weight)
  start_node      = nodes.values.first
  search_node     = nodes.values.last
  start_weight    = 0
  start_index     = 0
  stack           = [[start_node.value, start_weight, start_index]]
  visited         = [false] * nodes_count
  costs           = [nil] * nodes_count

  while stack.size.positive?
    current_value, current_cost, current_index = stack.pop

    next if visited[current_index]

    current_node             = nodes[current_value]
    visited[current_index]   = true
    costs[current_index]     = current_cost

    break if current_value == search_node.value

    min_adjacent_value = nil
    min_adjacent_cost  = nil

    current_node.list_adjacent_nodes.each do |adjacent_value, adjacent_cost|
      next if visited[adjacent_value - 1]

      if adjacent_value == search_node.value
        min_adjacent_value = adjacent_value
        min_adjacent_cost  = adjacent_cost
        break
      end

      if min_adjacent_cost.nil? || min_adjacent_cost > adjacent_cost
        min_adjacent_value = adjacent_value
        min_adjacent_cost  = adjacent_cost
      end
    end

    unless min_adjacent_value.nil? || min_adjacent_cost.nil?
      next_cost = (min_adjacent_cost - (costs.compact.sum))
      next_cost = 0 if next_cost.negative?
      stack    << [min_adjacent_value, next_cost, min_adjacent_value - 1]
    end
  end

  byebug
  if costs.last.nil?
    return print 'NO PATH EXISTS'
  end
  costs.compact.sum
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

####################
g_nodes = 1000

g_from = [1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11, 12, 12, 12, 13, 13, 13, 13, 13, 14, 14, 14, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 16, 17, 17, 17, 18, 18, 18, 18, 19, 19, 19, 20, 20, 20, 20, 20, 21, 21, 22, 22, 22, 22, 22, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 25, 25, 25, 25, 26, 26, 26, 27, 27, 27, 27, 28, 28, 28, 28, 28, 28, 28, 29, 29, 29, 29, 30, 30, 30, 30, 30, 31, 31, 31, 32, 32, 32, 32, 33, 33, 33, 34, 34, 35, 35, 35, 35, 36, 36, 36, 36, 37, 37, 37, 37, 38, 38, 38, 39, 39, 40, 40, 40, 40, 41, 41, 42, 42, 42, 43, 43, 44, 44, 44, 45, 45, 46, 46, 47, 47, 47, 47, 48, 48, 49, 49, 49, 50, 50, 51, 51, 52, 52, 53, 53, 53, 53, 54, 54, 54, 55, 55, 55, 56, 56, 56, 56, 57, 57, 57, 58, 58, 59, 59, 60, 60, 61, 61, 62, 63, 63, 64, 65, 65, 66, 66, 67, 68, 68, 69, 69, 70, 70, 70, 71, 72, 72, 73, 74, 74, 75, 76, 77, 78, 79, 80, 81, 81, 82, 83, 84, 85, 86, 87, 88, 89, 89, 90, 90, 90, 91, 92, 93, 93, 94, 95, 96, 97, 98, 99]

g_to = [2, 30, 68, 3, 36, 58, 4, 34, 52, 96, 5, 36, 75, 78, 6, 30, 43, 57, 85, 93, 7, 12, 32, 76, 8, 22, 55, 79, 97, 9, 57, 68, 10, 22, 59, 85, 11, 61, 78, 84, 12, 52, 68, 13, 54, 88, 14, 16, 37, 66, 99, 15, 53, 56, 75, 94, 16, 30, 55, 88, 17, 24, 37, 74, 98, 18, 43, 83, 19, 40, 44, 61, 20, 55, 87, 21, 59, 60, 68, 100, 22, 60, 23, 67, 90, 94, 99, 24, 28, 57, 79, 96, 25, 34, 40, 46, 63, 26, 50, 97, 100, 27, 51, 64, 28, 46, 56, 82, 29, 32, 61, 82, 87, 90, 96, 30, 31, 50, 98, 31, 55, 64, 69, 82, 32, 45, 70, 33, 35, 43, 88, 34, 73, 95, 35, 63, 36, 64, 86, 94, 37, 79, 87, 99, 38, 57, 64, 90, 39, 71, 97, 40, 86, 41, 52, 65, 73, 42, 84, 43, 77, 81, 44, 80, 45, 52, 79, 46, 60, 47, 89, 48, 62, 76, 83, 49, 88, 50, 64, 98, 51, 98, 52, 90, 53, 79, 54, 80, 90, 99, 55, 63, 87, 56, 63, 93, 57, 63, 70, 85, 58, 76, 85, 59, 92, 60, 84, 61, 98, 62, 85, 63, 64, 76, 65, 66, 84, 67, 69, 68, 69, 75, 70, 82, 71, 84, 99, 72, 73, 80, 74, 75, 82, 76, 77, 78, 79, 80, 81, 82, 86, 83, 84, 85, 86, 87, 88, 89, 90, 91, 91, 93, 97, 92, 93, 94, 98, 95, 96, 97, 98, 99, 100]

g_weight = [1696, 9506, 4029, 6110, 4674, 1595, 243, 2718, 2564, 9530, 1948, 4652, 9777, 6840, 9824, 7216, 1558, 1204, 1016, 6417, 7785, 2835, 5790, 6793, 341, 3981, 5050, 8677, 3681, 9803, 9588, 4066, 80, 6718, 8923, 3124, 3836, 4722, 1497, 4317, 4175, 6817, 3269, 389, 7349, 3144, 7198, 8068, 8819, 4711, 611, 787, 131, 411, 9714, 6156, 9364, 9452, 4805, 5921, 6372, 5428, 2614, 3537, 971, 5512, 8773, 2367, 4498, 6870, 3843, 792, 2336, 2179, 6423, 5632, 7151, 9054, 893, 7535, 7177, 9784, 5684, 1191, 7618, 732, 3776, 7359, 8106, 9591, 7623, 14, 2621, 7229, 7997, 1717, 4149, 3813, 2694, 6353, 5755, 4463, 4947, 8333, 1345, 271, 5838, 6433, 9339, 8311, 8412, 5199, 571, 8732, 353, 9914, 8508, 8329, 6185, 9197, 924, 9189, 9739, 1559, 9269, 9103, 8940, 2933, 9651, 9113, 9440, 8802, 9742, 7740, 130, 6148, 6390, 506, 7296, 7896, 977, 6936, 3990, 5765, 4224, 9983, 242, 7949, 2253, 2250, 5315, 6127, 72, 524, 1388, 6622, 8109, 8619, 6117, 2078, 1951, 6694, 3535, 2164, 3021, 860, 9149, 6379, 6311, 9278, 8012, 2754, 5796, 910, 8447, 4944, 7738, 8929, 8971, 7046, 8196, 6666, 1231, 9255, 2637, 7931, 7123, 3108, 8395, 7522, 3343, 3578, 6795, 8691, 9938, 4096, 6333, 1817, 6497, 7796, 2295, 6122, 6397, 8674, 5938, 7972, 5001, 3052, 394, 3899, 170, 8452, 1448, 404, 4030, 3417, 3912, 2080, 7811, 7791, 3289, 5719, 3650, 6423, 6852, 714, 4655, 9862, 2124, 386, 4804, 8817, 6032, 1715, 4341, 281, 7958, 8609, 1109, 1989, 8044, 7672, 4558, 5140, 4137, 2822, 5666, 3995, 1577, 8230, 1553, 6238, 849, 3808, 2569, 6256, 4838, 9650, 7799, 2416, 6653, 863, 9566]

##################

g_nodes = 45
g_from  = [1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 8, 8, 9]
g_to    = [2, 3, 4, 5, 6, 7, 8, 9, 10, 3, 4, 5, 6, 7, 8, 9, 10, 4, 5, 6, 7, 8, 9, 10, 5, 6, 7, 8, 9, 10, 6, 7, 8, 9, 10, 7, 8, 9, 10, 8, 9, 10, 9, 10, 10]

g_weight = [6337, 1594, 3766, 3645, 75, 5877, 8561, 242, 6386, 3331, 4194, 8069, 3934, 101, 8536, 6963, 9303, 7639, 8512, 1330, 6458, 1180, 3913, 1565, 9488, 1369, 8066, 9439, 7510, 6833, 4215, 194, 4774, 4328, 187, 1196, 200, 8743, 1433, 2933, 2069, 1974, 7349, 2351, 8423]

get_cost_v3(g_nodes, g_from, g_to, g_weight)
