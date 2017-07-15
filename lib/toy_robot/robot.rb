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

    def move
      return if @position.nil?
      position = @position.translate(vector)
      return unless @table.contains?(position)
      @position = position
    end
  end
end
