require 'spec_helper'

RSpec.describe ToyRobot::Point do
  let(:x) { 3 }
  let(:y) { 5 }
  let(:point) { described_class.new(x, y) }

  describe '#x' do
    it { expect(point.x).to eq x }
  end

  describe '#y' do
    it { expect(point.y).to eq y }
  end
end
