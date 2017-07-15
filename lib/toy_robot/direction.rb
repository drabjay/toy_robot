module ToyRobot
  # Direction
  module Direction
    TURN = (2 * Math::PI).freeze
    EAST = (0.0 * TURN).freeze
    NORTH = (0.25 * TURN).freeze
    WEST = (0.5 * TURN).freeze
    SOUTH = (0.75 * TURN).freeze

    attr_reader :facing

    def left
      turn(0.25)
    end

    def right
      turn(-0.25)
    end

    private

    def turn(t)
      @facing = (@facing + (t * TURN)) % TURN
    end
  end
end
