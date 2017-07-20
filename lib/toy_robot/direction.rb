require 'matrix'

module ToyRobot
  # Direction
  module Direction
    TURN = (2 * Math::PI).freeze
    ROUND = 12

    def self.directions
      %i[EAST NORTH WEST SOUTH]
    end

    def self.direction(direction)
      return if direction.nil?
      directions[direction / TURN * directions.length]
    end

    def self.vector(direction)
      return Vector[0, 0] if direction.nil?
      Vector[Math.cos(direction).round(ROUND), Math.sin(direction).round(ROUND)]
    end

    def self.valid?(direction)
      directions.map { |d| Direction.const_get(d) }.include?(direction)
    end

    def self.delta
      1.0 / directions.length
    end

    directions.each_with_index do |d, i|
      const_set(d, TURN * i / directions.length)
    end
  end
end
