require 'toy_robot/robot'
require 'toy_robot/table'
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
      name = input.split(' ').first
      args = input.split(' ').drop(1).join(' ')
      require "toy_robot/command/#{name.downcase}"
      command = Kernel.const_get("ToyRobot::Command::#{name.capitalize}")
      command.new(@robot, @table, args).execute
    end

    def start
      loop do
        input = gets
        break if input =~ /exit/i
        command_for(input)
      end
    end
  end
end
