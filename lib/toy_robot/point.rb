module ToyRobot
  # Cartesian point at which a Robot can be placed
  class Point
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def eql?(other)
      @x == other.x && @y == other.y
    end

    def translate(vector)
      Point.new(@x + vector.element(0), @y + vector.element(1))
    end
  end
end
