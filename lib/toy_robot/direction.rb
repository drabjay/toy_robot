module ToyRobot
  # Direction
  module Direction
    TURN = (2 * Math::PI).freeze
    EAST = (0.0 * TURN).freeze
    NORTH = (0.25 * TURN).freeze
    WEST = (0.5 * TURN).freeze
    SOUTH = (0.75 * TURN).freeze

    attr_reader :facing
  end
end
