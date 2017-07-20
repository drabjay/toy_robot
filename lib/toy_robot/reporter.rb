module ToyRobot
  # Report on a Robot as a String
  class Reporter
    def report(robot)
      @robot = robot.clone
    end

    def method_missing(method, *args)
      return @robot.send(method, *args) if @robot.respond_to?(method)
      super
    end

    def respond_to_missing?(method_name, include_private = false)
      @robot.respond_to?(method) || super
    end
  end
end
