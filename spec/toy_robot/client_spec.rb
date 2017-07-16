require 'spec_helper'

RSpec.describe ToyRobot::Client do
  let(:robot) { spy('robot') }
  let(:table) { ToyRobot::Table.new(5, 5) }
  let(:client) { described_class.new(robot, table) }

  describe '#command_for' do
    context 'when REPORT command' do
      it 'robot should receive report' do
        client.command_for('REPORT')
        expect(robot).to have_received(:report)
      end
    end
  end
end
