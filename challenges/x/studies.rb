
require "./challenges/x/y/peach_y"
require "./challenges/x/y/peach_z"

module Challenges
  module X
    module Studies
      include Challenges::X::Y::PeachY
      include Challenges::X::Y::PeachZ

      def test
        from_y
        from_z
      end
    end
  end
end
