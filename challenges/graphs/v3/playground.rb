require './challenges/graphs/v3/graph.rb'
require './challenges/graphs/v3/node.rb'

nodes      = ('A'..'Z').map { |char| Node.new(char) }
nodes_hash = nodes.map { |node| [node.name, node] }.to_h

edges = {
  'A' => %w[B C D],
  'B' => %w[E F C],
  'C' => %w[G H],
  'D' => %w[I J],
  'E' => %w[K],
  'F' => %w[L M],
  'G' => %w[N],
  'H' => %w[O P I],
  'I' => %w[Q R],
  'J' => %w[S T],
  'K' => %w[U],
  'L' => %w[V],
  'M' => %w[W],
  'N' => %w[X],
  'O' => %w[Y Z]
}

edges.each do |from, to_list|
  from_node = nodes_hash[from]

  to_list.each do |to|
    from_node.add_edge(nodes_hash[to])
  end
end

graph = Graph.new(nodes)

graph.print(nodes.first)

puts "\n------\n"

initial_node     = graph.nodes_hash["A"]
destination_node = graph.nodes_hash["T"]

puts graph.bfs(
  initial_node:     initial_node,
  destination_node: destination_node,
)

puts "\n------\n"

puts graph.dfs(
  initial_node:     initial_node,
  destination_node: destination_node,
)
