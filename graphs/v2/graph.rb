# frozen_string_literal: true

require 'byebug'

module V2
  class Graph

    attr_accessor :nodes

    def initialize(nodes)
      @nodes            = nodes
      @internal_details = {
        bipartite: true
      }
    end

    def add(node, connect_node: nodes.last)
      nodes << node

      connect_node.connect(node)

      internal_details[:bipartite] = true
    end

    def print
      nodes.each do |node|
        puts "NODE: #{node.value}"
        node.list_adjacent_nodes.each do |adjacent_node|
          puts "CONNECTS: #{adjacent_node.value}"
        end

        puts "\n"
      end

      nil
    end

    # NOTE: breadth-first search;
    # 
    #       use a queue (first in, first out) to search,
    #       it means that we validate always all the adjacencies from
    #       the start node, to then validate the sub nodes from the adjacencies
    # 
    #       there is no way to use recursion;
    # 
    def bfs(start: nodes.first, destination: nodes.last)
      visited = []
      queue   = [start]
      result  = false

      while queue.length > 0
        dequeued_node = queue.shift

        next if visited.include?(dequeued_node.value)

        visited << dequeued_node.value

        break result = true if dequeued_node.value == destination.value

        push_adjacent_nodes(
          node:           dequeued_node,
          visited:        visited,
          data_structure: queue
        )
      end

      puts "BFS search:"
      puts "-> VISITED NODES: #{visited}"
      puts "-> FOUND NODE: #{result}"

      result
    end

    # NOTE: depth-first search;
    # 
    #       use a stack (last in, first out) to search,
    #       it means that we validate always one adjacency from
    #       the start node, then validate one sub node from the adjacency
    #       until we reach the end (depth);
    #
    #       can use recursion or a stack;
    # 
    def dfs(start: nodes.first, destination: nodes.last)
      visited = []
      stack   = [start]
      result  = false

      while stack.length > 0
        dequeued_node = stack.pop

        next if visited.include?(dequeued_node.value)

        visited << dequeued_node.value

        break result = true if dequeued_node.value == destination.value

        push_adjacent_nodes(
          node:           dequeued_node,
          visited:        visited,
          data_structure: stack
        )
      end

      puts "DFS search:"
      puts "-> VISITED NODES: #{visited}"
      puts "-> FOUND NODE: #{result}"

      result
    end

    def connected_components_count
      count   = 0
      visited = []

      nodes.each do |node|
        if explore(start_node: node, visited: visited)
          count += 1
        end
      end

      puts "DFS search:"
      puts "-> CONNECTED COMPONENTS: #{count}"
      puts "-> PER GROUP: #{nodes_group.values.map(&:size)}"
      puts "-> COMPONENTS PER GROUP: #{nodes_group.values.map { |group| group.map(&:value) }}"
    end

    def largest_connected_component
      count       = 0
      nodes_group = {}
      visited     = []
      largest     = []

      nodes.each do |node|
        if explore_size(start_node: node, visited: visited, nodes_group: nodes_group, count: count)
          count += 1
        end
      end

      nodes_group.values.each do |group|
        largest = group if largest.size < group.size
      end

      puts "DFS search:"
      puts "-> LARGEST COMPONENT SIZE: #{largest.size}"
      puts "-> LARGEST COMPONENT GROUP: #{largest.map(&:value)}"
    end

    # NOTE: a bipartite graph is a graph where the number of
    #       nodes can be splited equally by two by color.
    #       the two sets are nodes not connected to nodes of the same color.
    #       
    def is_bipartite?
      visited = []

      nodes.each do |node|
        assign_legal_coloring(node, visited) if !visited.include?(node.value) && internal_details[:bipartite]

        break if !internal_details[:bipartite]
      end

      puts "DFS search (bipartite):"
      puts "-> VISITED NODES: #{visited}"
      puts "-> IS BIPARTITE? #{internal_details[:bipartite]}"

      internal_details[:bipartite]
    end

    def execute_bipartite
      if is_bipartite?
        red  = nodes.select { |node| node.color == 'red' }.map(&:value)
        blue = nodes.select { |node| node.color == 'blue' }.map(&:value)

        puts "red group: #{red}"
        puts "blue blue: #{blue}"

        [red, blue]
      else
        puts "not possible to make two equal sets"

        false
      end
    end

    private

    attr_accessor :internal_details

    def push_adjacent_nodes(node:, visited:, data_structure:)
      adjacencies = node.list_adjacent_nodes

      adjacencies.each do |adjacent_node|
        next if visited.include?(adjacent_node.value)

        data_structure << adjacent_node
      end
    end

    def explore(start_node:, visited:)
      return false if visited.include?(start_node.value)

      visited << start_node.value

      start_node.list_adjacent_nodes.each do |node|
        explore(start_node: node, visited: visited)
      end

      true
    end

    def explore_size(start_node:, visited:, nodes_group:, count:)
      return false if visited.include?(start_node.value)

      visited << start_node.value

      nodes_group[count] ||= []
      nodes_group[count] << start_node

      start_node.list_adjacent_nodes.each do |node|
        explore_size(start_node: node, visited: visited, nodes_group: nodes_group, count: count)
      end

      true
    end

    def assign_legal_coloring(start_node, visited)
      # NOTE: commented because this is not a normal DFS
      #       we have to check whether the start_node has the same color being
      #       assigned, to garantee that this graph is a bipartite;
      # 
      # return if visited.include?(start_node)

      visited << start_node.value

      if start_node.color.nil?
        start_node.color = 'red'
      end

      start_node.list_adjacent_nodes.each do |adjacent_node|
        if !visited.include?(adjacent_node.value)
          adjacent_node.color = start_node.color == 'red' ? 'blue' : 'red'

          assign_legal_coloring(adjacent_node, visited)
        else
          break internal_details[:bipartite] = false if adjacent_node.color == start_node.color 
        end
      end
    end
  end
end
