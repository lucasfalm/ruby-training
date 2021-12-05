# frozen_string_literal: true

module GameCore
  module Base

    attr_accessor :round

    def initialize name
      @name = name
      @round = nil
    end

    def next_round last_round: nil, settings: {}
      puts "Game::Base#next_round with #{last_round}, #{settings}"

      self.round = {}
    end

    def game_modes
      raise "game_modes not implemented"
    end

    def name
      raise "name not implemented"
    end

    def version
      raise "version not implemented"
    end
  end
end
