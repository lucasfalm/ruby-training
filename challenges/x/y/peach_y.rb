require "./challenges/x/z/peach_z"

module Challenges
  module X
    module Y
      module PeachY
        include Challenges::X::Y::PeachZ

        def from_y
          puts "y"
          from_z
        end
      end
    end
  end
end
