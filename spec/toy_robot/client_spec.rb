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

    context 'when RIGHT command' do
      it 'robot should receive RIGHT' do
        client.command_for('RIGHT')
        expect(robot).to have_received(:right)
      end
    end

    context 'when LEFT command' do
      it 'robot should receive LEFT' do
        client.command_for('LEFT')
        expect(robot).to have_received(:left)
      end
    end
  end
end
