require 'toy_robot/reporter'

module ToyRobot
  # Report on a Robot
  class StringReporter < Reporter
    def report(robot)
      super(robot)
      return unless placed?
      "#{position},#{facing}"
    end
  end
end
