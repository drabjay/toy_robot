require 'toy_robot/string_reporter'

module ToyRobot
  # Report on a Robot
  module Reportable
    attr_accessor :reporter

    def self.included(base)
      base.prepend Initializer
    end

    # initialize method to be prepended to the including class
    module Initializer
      def initialize(*)
        super if defined? super
        @reporter ||= ToyRobot::StringReporter.new
      end
    end

    def report
      reporter.report(self)
    end
  end
end
