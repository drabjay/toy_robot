require 'toy_robot/robot'
require 'toy_robot/table'
require 'toy_robot/input'
require 'toy_robot/command'

module ToyRobot
  # Command Client
  class Client
    def self.start
      new.start
    end

    def initialize(robot = Robot.new, table = Table.new(5, 5))
      @robot = robot
      @table = table
    end

    def command_for(input)
      require "toy_robot/command/#{input.first_downcase}"
      command = Kernel.const_get("ToyRobot::Command::#{input.first_capitalize}")
      command.new(@robot, @table, input.but_first_word).execute
    end

    def start
      loop do
        input = ToyRobot::Input.new(gets)
        break if input.exit?
        command_for(input)
      end
    end
  end
end
