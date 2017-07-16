module ToyRobot
  # Command
  class Command
    def initialize(robot, table, args)
      @robot = robot
      @table = table
      @args = args
    end

    def execute
      raise NotImplementedError
    end
  end
end
