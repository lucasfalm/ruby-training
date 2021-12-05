# frozen_string_literal: true

require_relative '../core/base'
require_relative '../core/trigger_spin'
require_relative '../features/sticky_symbol'

module Games
  class Example

    include GameCore::Base
    include GameCore::TriggerSpin

    # NOTE: this is an example of decorator, adding
#           behavior without changing the class base (game)
    include Features::StickySymbol 

    NAME = "Example Game"
    SETTINGS = {}
    VERSION = 1_0_0

    def initialize
      @name = NAME
      @settings = SETTINGS
      @version = VERSION
    end

    def game_modes
      %i(easy medium extreme)
    end

    def name
      NAME
    end

    def version
      VERSION
    end
  end
end
