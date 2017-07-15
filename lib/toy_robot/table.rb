module ToyRobot
  # Table on which a Robot can be placed
  class Table
    attr_reader :width, :depth

    def initialize(width, depth)
      @width = width
      @depth = depth
    end

    def contains?(point)
      (0..@width).cover?(point.x) && (0..@depth).cover?(point.y)
    end
  end
end
