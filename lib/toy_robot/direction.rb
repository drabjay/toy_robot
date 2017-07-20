require 'matrix'

module ToyRobot
  # Direction
  class Direction
    TURN = (2 * Math::PI).freeze
    ROUND = 12

    def self.directions
      %i[EAST NORTH WEST SOUTH]
    end

    def self.delta
      1.0 / directions.length
    end

    attr_reader :radians

    def initialize(radians)
      @radians = radians
    end

    def left
      rotate(+self.class.delta)
    end

    def right
      rotate(-self.class.delta)
    end

    def to_s
      self.class.directions[@radians / TURN * self.class.directions.length].to_s
    end

    def vector
      Vector[Math.cos(@radians).round(ROUND), Math.sin(@radians).round(ROUND)]
    end

    def ==(other)
      @radians == other.radians
    end

    private

    def rotate(t)
      self.class.new((@radians + (t * TURN)) % TURN)
    end

    directions.each_with_index do |d, i|
      const_set(d, new(TURN * i / directions.length))
    end
  end
end
