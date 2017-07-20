require 'toy_robot/direction'

module ToyRobot
  # Direction
  module Faceable
    attr_reader :facing

    def facing=(direction)
      return unless faceable?(direction)
      @facing = direction
    end

    def left
      turn(+ToyRobot::Direction.delta)
    end

    def right
      turn(-ToyRobot::Direction.delta)
    end

    def direction
      ToyRobot::Direction.direction(@facing)
    end

    def vector
      ToyRobot::Direction.vector(@facing)
    end

    def facing?
      !@facing.nil?
    end

    def faceable?(facing)
      ToyRobot::Direction.valid?(facing)
    end

    private

    def turn(t)
      return unless facing?
      self.facing =
        (@facing + (t * ToyRobot::Direction::TURN)) % ToyRobot::Direction::TURN
    end
  end
end
