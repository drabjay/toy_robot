require 'spec_helper'

RSpec.describe ToyRobot::Client do
  let(:robot) { spy('robot') }
  let(:table) { ToyRobot::Table.new(5, 5) }
  let(:client) { described_class.new(robot, table) }

  def received_command(command)
    client.command_for(command)
    expect(robot).to have_received(command.downcase)
  end

  describe '#command_for' do
    context 'when REPORT command' do
      it { received_command('REPORT') }
    end

    context 'when RIGHT command' do
      it { received_command('RIGHT') }
    end

    context 'when LEFT command' do
      it { received_command('LEFT') }
    end

    context 'when MOVE command' do
      it { received_command('MOVE') }
    end
  end
end
