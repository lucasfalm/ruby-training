# frozen_string_literal: true

module Shape::Rendered

  class Vector

    def render_circle radius:
      puts "rendering circle as vector with radius of #{radius}"
    end

    def render_square width:
      puts "rendering square as vector with width of #{width}"
    end
  end
end
