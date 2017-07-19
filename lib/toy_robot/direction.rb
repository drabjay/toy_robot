require 'matrix'

module ToyRobot
  # Direction
  module Direction
    TURN = (2 * Math::PI).freeze
    ROUND = 12

    def self.included(base)
      base.extend ClassMethods
      base.directions.each_with_index do |d, i|
        Direction.const_set(d, TURN * i / base.directions.length)
      end
    end

    # Methods to add to including class
    module ClassMethods
      def directions
        %i[EAST NORTH WEST SOUTH]
      end
    end

    attr_reader :facing

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
      self.class.directions[@facing / TURN * self.class.directions.length]
    end

    def facing?
      !@facing.nil?
    end

    private

    def delta
      1.0 / self.class.directions.length
    end

    def turn(t)
      return unless facing?
      @facing = (@facing + (t * TURN)) % TURN
    end
  end
end
