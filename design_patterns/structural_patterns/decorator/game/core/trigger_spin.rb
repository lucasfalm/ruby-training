# frozen_string_literal: true

module GameCore
  module TriggerSpin
    def next_round(last_round: nil, settings: {})
      super last_round: last_round,
            settings: settings

      settings[:spin] = true

      puts "Game::TriggerSpin#next_round with #{last_round}, #{settings}"
    end
  end
end
