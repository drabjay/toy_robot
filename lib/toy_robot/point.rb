module ToyRobot
  # Cartesian point at which a Robot can be placed
  class Point
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end
  end
end
