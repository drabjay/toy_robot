require 'spec_helper'
require 'open3'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'bin/toy_robot' do
  describe 'example a' do
    report = ''
    Open3.popen3('bin/toy_robot') do |i, o|
      i.puts 'PLACE 0,0,NORTH'
      i.puts 'MOVE'
      i.puts 'REPORT'
      i.close
      report = o.gets.chomp
      o.close
    end
    it { expect(report).to eq '0,1,NORTH' }
  end

  describe 'example b' do
    report = ''
    Open3.popen3('bin/toy_robot') do |i, o|
      i.puts 'PLACE 0,0,NORTH'
      i.puts 'LEFT'
      i.puts 'REPORT'
      i.close
      report = o.gets.chomp
      o.close
    end
    it { expect(report).to eq '0,0,WEST' }
  end

  describe 'example c' do
    report = ''
    Open3.popen3('bin/toy_robot') do |i, o|
      i.puts 'PLACE 1,2,EAST'
      i.puts 'MOVE'
      i.puts 'MOVE'
      i.puts 'LEFT'
      i.puts 'MOVE'
      i.puts 'REPORT'
      i.close
      report = o.gets.chomp
      o.close
    end
    it { expect(report).to eq '3,3,NORTH' }
  end
end
# rubocop:enable Metrics/BlockLength
