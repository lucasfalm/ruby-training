class Node
  
    attr_reader :value
    
    def initialize(value)
      @value = value
      @adjacent_nodes = []
    end
    
    def add_edge(adjacent_node)
      @adjacent_nodes << adjacent_node
    end
    
end

class Graph
  
    def initialize
      @nodes = {}
    end
    
    def add_node(node)
      @nodes[node.value] = node
    end
    
    def add_edge(node1, node2)
      @nodes[node1].add_edge(@nodes[node2])
      @nodes[node2].add_edge(@nodes[node1])
    end
    
end

n1 = Node.new("a")
n2 = Node.new("b")
n3 = Node.new("c")
n4 = Node.new("d")
g = Graph.new
g.add_node(n1,n2,n3,n4)
g.add_edge(n2,n3)

