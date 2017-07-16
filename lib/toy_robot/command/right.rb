module ToyRobot
  class Command
    # Right Command
    class Right < Command
      def execute
        puts @robot.right
      end
    end
  end
end
