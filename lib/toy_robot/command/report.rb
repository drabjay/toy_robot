module ToyRobot
  class Command
    # Report Command
    class Report < Command
      def execute
        puts @robot.report
      end
    end
  end
end
