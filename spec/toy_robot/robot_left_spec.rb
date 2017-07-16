require 'spec_helper'

RSpec.describe ToyRobot::Robot do
  describe '#left' do
    let(:table) { ToyRobot::Table.new(5, 7) }
    let(:facing) { ToyRobot::Direction::SOUTH }
    before(:each) do
      robot.place(table, position, facing)
      robot.left
    end

    context 'when not placed' do
      let(:robot) { described_class.new }
      let(:position) { ToyRobot::Point.new(6, 8) }
      it { expect(robot.position).to be_nil }
    end

    context 'when initially facing south' do
      let(:robot) { described_class.new }
      let(:position) { ToyRobot::Point.new(3, 5) }
      it { expect(robot.facing).to eq ToyRobot::Direction::EAST }
    end
  end
end
