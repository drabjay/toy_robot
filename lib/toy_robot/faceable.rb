require 'toy_robot/direction'

module ToyRobot
  # Faceable
  module Faceable
    attr_reader :facing

    def facing=(direction)
      @facing = direction
    end

    def left
      return unless facing?
      @facing = @facing.left
    end

    def right
      return unless facing?
      @facing = @facing.right
    end

    def facing?
      !@facing.nil?
    end
  end
end
