require 'toy_robot/reporter'

module ToyRobot
  # Report on a Robot
  class StringReporter < Reporter
    def report(robot)
      super(robot)
      return unless placed?
      "#{position},#{direction}"
    end
  end
end
