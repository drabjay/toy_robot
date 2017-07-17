require 'spec_helper'
require 'open3'

RSpec.describe 'bin/toy_robot' do
  subject do
    Open3.popen3('bin/toy_robot') do |i, o|
      commands.each { |command| i.puts command }
      i.close
      o.gets.chomp
    end
  end

  describe 'example a' do
    let(:commands) { ['PLACE 0,0,NORTH', 'MOVE', 'REPORT'] }
    it { expect(subject).to eq '0,1,NORTH' }
  end

  describe 'example b' do
    let(:commands) { ['PLACE 0,0,NORTH', 'LEFT', 'REPORT'] }
    it { expect(subject).to eq '0,0,WEST' }
  end

  describe 'example c' do
    let(:commands) do
      ['PLACE 1,2,EAST', 'MOVE', 'MOVE', 'LEFT', 'MOVE', 'REPORT']
    end
    it { expect(subject).to eq '3,3,NORTH' }
  end

  describe 'example d' do
    let(:commands) { ['PLACE 1,1,SOUTH', 'MOVE', 'REPORT'] }
    it { expect(subject).to eq '1,0,SOUTH' }
  end
end
