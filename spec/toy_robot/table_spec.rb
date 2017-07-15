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

  describe '#contains?' do
    context 'when table contains point' do
      let(:point) { ToyRobot::Point.new(3, 5) }
      it { expect(table.contains?(point)).to be true }
    end

    context 'when table does not contain point' do
      let(:point) { ToyRobot::Point.new(3, 8) }
      it { expect(table.contains?(point)).to be false }
    end
  end
end
