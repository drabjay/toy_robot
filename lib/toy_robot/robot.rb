module ToyRobot
  # Robot
  class Robot
    attr_reader :table, :position

    def place(table, position)
      return unless table.contains?(position)
      @table = table
      @position = position
    end
  end
end
