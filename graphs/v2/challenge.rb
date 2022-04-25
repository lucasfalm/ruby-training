# frozen_string_literal: true

require_relative 'graph'
require_relative 'node'

# nodes = []

# jack  = V2::Node.new(value: 'jack')
# emily = V2::Node.new(value: 'emily')
# lucy  = V2::Node.new(value: 'lucy')
# brian = V2::Node.new(value: 'brian')
# david = V2::Node.new(value: 'david')
# jose  = V2::Node.new(value: 'jose')
# paul  = V2::Node.new(value: 'paul')
# chris = V2::Node.new(value: 'chris')

# jack.connect(brian).connect(emily)

# brian.connect(chris)

# emily.connect(lucy)

# lucy.connect(david).connect(brian)

# # david.connect(jose).connect(chris)

# # jose.connect(paul)

# # paul.connect(chris)

# nodes << jack << emily << lucy << brian << chris
# # nodes << david << jose << paul << chris

# jose.connect(chris)

# V2::Graph.new(nodes).bfs(search_value: 'paul')

# ####################################################### #

# a = V2::Node.new(value: 'a')
# b = V2::Node.new(value: 'b')
# c = V2::Node.new(value: 'c')
# d = V2::Node.new(value: 'd')
# e = V2::Node.new(value: 'e')
# f = V2::Node.new(value: 'f')

# a.connect(b).connect(c)

# b.connect(d)

# c.connect(e)

# d.connect(f)

# # f.connect(b)

# nodes = [a, c, b, d, e, f]

# V2::Graph.new(nodes).bfs(search_value: 'c')
# V2::Graph.new(nodes).dfs(search_value: 'c')
# V2::Graph.new(nodes).is_bipartite?

# ####################################################### #

flp = V2::Node.new(value: 'flp', undirected: false)
sp  = V2::Node.new(value: 'sp', undirected: false)
rj  = V2::Node.new(value: 'rj', undirected: false)
mg  = V2::Node.new(value: 'mg', undirected: false)
bh  = V2::Node.new(value: 'bh', undirected: false)
pr  = V2::Node.new(value: 'pr', undirected: false)

flp.connect(sp)

sp.connect(rj)

mg.connect(sp)

rj.connect(mg)

bh.connect(pr)

nodes = [flp, sp, mg, rj, bh, pr]

graph = V2::Graph.new(nodes)
graph.print

# graph.bfs(start: flp, destination: rj)
# graph.bfs(start: rj, destination: flp)
# graph.bfs(start: mg, destination: rj)

# graph.dfs(start: flp, destination: bh)
# graph.is_bipartite?

# graph.connected_components_count
graph.largest_connected_component
