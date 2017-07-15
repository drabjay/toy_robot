require 'spec_helper'

RSpec.describe ToyRobot::Robot do
  describe '#right' do
    before(:each) do
      robot.place(table, position, facing)
      robot.right
    end

    context 'when initially facing east' do
      let(:robot) { described_class.new }
      let(:table) { ToyRobot::Table.new(5, 7) }
      let(:position) { ToyRobot::Point.new(3, 5) }
      let(:facing) { ToyRobot::Direction::EAST }
      it { expect(robot.facing).to eq ToyRobot::Direction::SOUTH }
    end
  end
end
