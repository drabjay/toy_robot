require 'spec_helper'

RSpec.describe ToyRobot::Robot do
  describe '#place' do
    let(:table) { ToyRobot::Table.new(5, 7) }
    let(:facing) { ToyRobot::Direction::WEST }
    before(:each) { robot.place(table, position, facing) }

    context 'when placed at position on table' do
      let(:robot) { described_class.new }
      let(:position) { ToyRobot::Point.new(3, 5) }
      it { expect(robot.table).to eq table }
      it { expect(robot.position).to eq position }
      it { expect(robot.facing).to eq ToyRobot::Direction::WEST }
    end

    context 'when placed at position not on table' do
      let(:robot) { described_class.new }
      let(:position) { ToyRobot::Point.new(3, 8) }
      it { expect(robot.table).to be_nil }
      it { expect(robot.position).to be_nil }
      it { expect(robot.facing).to be_nil }
    end
  end
end
