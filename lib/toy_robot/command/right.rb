module ToyRobot
  class Command
    # Right Command
    class Right < Command
      def execute
        @robot.right
      end
    end
  end
end
