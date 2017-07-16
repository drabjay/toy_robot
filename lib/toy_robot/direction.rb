require 'matrix'

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

    def vector
      Vector[Math.cos(@facing), Math.sin(@facing)]
    end

    private

    def turn(t)
      return if @facing.nil?
      @facing = (@facing + (t * TURN)) % TURN
    end
  end
end
