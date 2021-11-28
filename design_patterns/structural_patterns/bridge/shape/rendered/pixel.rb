# frozen_string_literal: true

module Shape::Rendered

  class Pixel

    def render_circle radius:
      puts "rendering circle as pixel with radius of #{radius}"
    end

    def render_square width:
      puts "rendering square as pixel with width of #{width}"
    end
  end
end
