
module Helpers
  module Print
    def initialize(*args, **kwargs)
      @visited_print = {}
    end

    def print(node = nil, indent = '', is_last = true)
      node ||= @nodes.first

      return if @visited_print[node.name]

      @visited_print[node.name] = true

      connector = is_last ? '└── ' : '├── '
      puts "#{indent}#{connector}#{node.name}"

      indent += is_last ? '    ' : '│   '

      node.edges.each_with_index do |edge, index|
        is_last = index == node.edges.size - 1
        print(edge, indent, is_last)
      end
    end

    private

    def reset_visited_print
      @visited_print = {}
    end
  end
end
