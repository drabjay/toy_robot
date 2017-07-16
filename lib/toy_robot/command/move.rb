module ToyRobot
  class Command
    # Move Command
    class Move < Command
      def execute
        @robot.move
      end
    end
  end
end
