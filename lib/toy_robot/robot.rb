require 'toy_robot/point'
require 'toy_robot/direction'
require 'toy_robot/reportable'

module ToyRobot
  # Robot
  class Robot
    include Reportable

    attr_reader :table, :position, :facing

    def place(table, position, facing)
      return unless table.contains?(position) && !facing.nil?
      @table = table
      @position = position
      @facing = facing
    end

    def move
      return unless placed? && facing?
      position = @position.translate(@facing.vector)
      return unless @table.contains?(position)
      @position = position
    end

    def left
      return unless facing?
      @facing = @facing.rotate(+ToyRobot::Direction.delta)
    end

    def right
      return unless facing?
      @facing = @facing.rotate(-ToyRobot::Direction.delta)
    end

    def facing?
      !@facing.nil?
    end

    def placed?
      !@position.nil?
    end
  end
end
