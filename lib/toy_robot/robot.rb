require 'toy_robot/direction'
require 'toy_robot/point'

module ToyRobot
  # Robot
  class Robot
    include Direction

    attr_reader :table, :position

    def place(table, position, facing)
      return unless table.contains?(position)
      @table = table
      @position = position
      @facing = facing
    end

    def move
      return unless placed?
      position = @position.translate(vector)
      return unless @table.contains?(position)
      @position = position
    end

    def report
      return unless placed?
      "#{@position},#{direction}"
    end

    def placed?
      !@position.nil? && facing?
    end
  end
end
