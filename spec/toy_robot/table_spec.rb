require 'spec_helper'

RSpec.describe ToyRobot::Table do
  let(:width) { 5 }
  let(:depth) { 7 }
  let(:table) { described_class.new(width, depth) }

  describe '#width' do
    it { expect(table.width).to eq width }
  end

  describe '#depth' do
    it { expect(table.depth).to eq depth }
  end
end
