require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe ToyRobot::Client do
  let(:robot) { spy('robot') }
  let(:table) { ToyRobot::Table.new(5, 5) }
  let(:client) { described_class.new(robot, table) }

  def received_command(input, *args)
    client.command_for(ToyRobot::Input.new(input))
    expect(robot).to have_received(input.split(' ').first.downcase).with(*args)
  end

  describe '#command_for' do
    context 'when REPORT command' do
      it { received_command('REPORT', no_args) }
    end

    context 'when RIGHT command' do
      it { received_command('RIGHT', no_args) }
    end

    context 'when LEFT command' do
      it { received_command('LEFT', no_args) }
    end

    context 'when MOVE command' do
      it { received_command('MOVE', no_args) }
    end

    context 'when PLACE command' do
      it {
        received_command(
          'PLACE 3,2,NORTH',
          table,
          ToyRobot::Point.new(3, 2),
          ToyRobot::Direction::NORTH
        )
      }
    end
  end
end
# rubocop:enable Metrics/BlockLength
