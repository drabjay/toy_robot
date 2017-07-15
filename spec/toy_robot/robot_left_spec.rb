require 'spec_helper'

RSpec.describe ToyRobot::Robot do
  describe '#left' do
    before(:each) do
      robot.place(table, position, facing)
      robot.left
    end

    context 'when initially facing south' do
      let(:robot) { described_class.new }
      let(:table) { ToyRobot::Table.new(5, 7) }
      let(:position) { ToyRobot::Point.new(3, 5) }
      let(:facing) { ToyRobot::Direction::SOUTH }
      it { expect(robot.facing).to eq ToyRobot::Direction::EAST }
    end
  end
end
