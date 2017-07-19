require 'toy_robot/direction'
require 'toy_robot/point'

module ToyRobot
  # Robot
  class Robot
    include Direction

    attr_reader :table, :position

    def place(table, position, facing)
      return unless table.contains?(position) && valid?(facing)
      @table = table
      @position = position
      self.facing = facing
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
