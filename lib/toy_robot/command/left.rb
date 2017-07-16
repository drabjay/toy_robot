module ToyRobot
  class Command
    # Left Command
    class Left < Command
      def execute
        @robot.left
      end
    end
  end
end
