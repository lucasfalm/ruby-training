# frozen_string_literal: true

require_relative 'graph'
require_relative 'node'

nodes = []

jack  = V2::Node.new(value: 'jack')
emily = V2::Node.new(value: 'emily')
lucy  = V2::Node.new(value: 'lucy')
brian = V2::Node.new(value: 'brian')
david = V2::Node.new(value: 'david')
jose  = V2::Node.new(value: 'jose')
paul  = V2::Node.new(value: 'paul')
chris = V2::Node.new(value: 'chris')

jack.connect(brian).connect(emily)

brian.connect(chris)

emily.connect(lucy)

lucy.connect(david).connect(brian)

david.connect(jose).connect(chris)

jose.connect(paul)

paul.connect(chris)

nodes << jack << emily << lucy << brian
nodes << david << jose << paul << chris

jose.connect(chris)

# V2::Graph.new(nodes).execute_bipartite_challenge
V2::Graph.new(nodes).bfs('paul')