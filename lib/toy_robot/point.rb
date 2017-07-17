module ToyRobot
  # Cartesian point at which a Robot can be placed
  class Point
    attr_reader :x, :y

    def initialize(x, y)
      @x = x.to_i
      @y = y.to_i
    end

    def eql?(other)
      @x == other.x && @y == other.y
    end

    def translate(vector)
      self.class.new(@x + vector.element(0), @y + vector.element(1))
    end

    def to_s
      "#{x},#{y}"
    end
  end
end
