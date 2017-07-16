module ToyRobot
  class Command
    # Place Command
    class Place < Command
      def execute
        return if args.length < 3
        @robot.place(@table, position, facing)
      end

      private

      def position
        Point.new(args[0], args[1])
      end

      def facing
        Kernel.const_get("ToyRobot::Direction::#{args[2].upcase}")
      end
    end
  end
end
