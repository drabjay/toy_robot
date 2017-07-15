require 'toy_robot/direction'

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
  end
end
