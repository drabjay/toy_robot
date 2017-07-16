require 'spec_helper'

RSpec.describe ToyRobot::Robot do
  describe '#report' do
    let(:table) { ToyRobot::Table.new(5, 7) }
    let(:facing) { ToyRobot::Direction::WEST }
    before(:each) { robot.place(table, position, facing) }

    context 'when placed' do
      let(:robot) { described_class.new }
      let(:position) { ToyRobot::Point.new(3, 5) }
      it { expect(robot.report).to eq '3,5,WEST' }
    end

    context 'when not placed' do
      let(:robot) { described_class.new }
      let(:position) { ToyRobot::Point.new(3, 8) }
      it { expect(robot.report).to be_nil }
    end
  end
end
