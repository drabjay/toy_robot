require 'spec_helper'

RSpec.describe ToyRobot::Robot do
  describe '#move' do
    let(:table) { ToyRobot::Table.new(5, 7) }
    before(:each) do
      robot.place(table, position, facing)
      robot.move
    end

    context 'when not placed' do
      let(:robot) { described_class.new }
      let(:position) { ToyRobot::Point.new(6, 8) }
      let(:facing) { ToyRobot::Direction::EAST }
      it { expect(robot.position).to be_nil }
    end

    context 'when moving inside table' do
      let(:robot) { described_class.new }
      let(:position) { ToyRobot::Point.new(3, 5) }
      let(:facing) { ToyRobot::Direction::EAST }
      it { expect(robot.position).to eql ToyRobot::Point.new(4, 5) }
    end

    context 'when moving outside table' do
      let(:robot) { described_class.new }
      let(:position) { ToyRobot::Point.new(0, 4) }
      let(:facing) { ToyRobot::Direction::WEST }
      it { expect(robot.position).to eql ToyRobot::Point.new(0, 4) }
    end
  end
end
