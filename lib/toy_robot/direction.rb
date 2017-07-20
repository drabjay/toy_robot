require 'matrix'

module ToyRobot
  # Direction
  module Direction
    TURN = (2 * Math::PI).freeze
    ROUND = 12

    def self.directions
      %i[EAST NORTH WEST SOUTH]
    end

    attr_reader :facing

    def facing=(value)
      return unless valid?(value)
      @facing = value
    end

    def left
      turn(+delta)
    end

    def right
      turn(-delta)
    end

    def vector
      return Vector[0, 0] unless facing?
      Vector[Math.cos(@facing).round(ROUND), Math.sin(@facing).round(ROUND)]
    end

    def direction
      return unless facing?
      Direction.directions[@facing / TURN * Direction.directions.length]
    end

    def facing?
      !@facing.nil?
    end

    private

    def valid?(facing)
      Direction.directions.map { |d| Direction.const_get(d) }.include?(facing)
    end

    def delta
      1.0 / Direction.directions.length
    end

    def turn(t)
      return unless facing?
      self.facing = (@facing + (t * TURN)) % TURN
    end

    directions.each_with_index do |d, i|
      const_set(d, TURN * i / directions.length)
    end
  end
end
