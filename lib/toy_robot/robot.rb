require 'toy_robot/point'
require 'toy_robot/faceable'
require 'toy_robot/reportable'

module ToyRobot
  # Robot
  class Robot
    include Faceable
    include Reportable

    attr_reader :table, :position

    def place(table, position, facing)
      return unless table.contains?(position)
      @table = table
      @position = position
      self.facing = facing
    end

    def move
      return unless placed?
      position = @position.translate(@facing.vector)
      return unless @table.contains?(position)
      @position = position
    end

    def placed?
      !@position.nil? && facing?
    end
  end
end
