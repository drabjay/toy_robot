module ToyRobot
  # Table on which a Robot can be placed
  class Table
    attr_reader :width, :depth

    def initialize(width, depth)
      @width = width
      @depth = depth
    end
  end
end
