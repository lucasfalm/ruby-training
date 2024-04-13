require "./challanges/x/y/peach_y"

module Challenges
  module X
    module Z
      module PeachZ
        include Challenges::X::Y::PeachY

        def from_z
          puts "z"
          from_y
        end
      end
    end
  end
end
