require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/keys.rb'
require './lib/offsets.rb'
require './lib/shifts.rb'

RSpec.describe Shifts do
  before :each do
    @shifts = Shifts.new('02715', '040895')
  end

  describe 'instantiation' do

    it 'exists' do
      expect(@shifts).to be_an_instance_of(Shifts)
    end

    it 'has readable attributes' do
      expect(@shifts.keys).to be_an_instance_of(Keys)
      expect(@shifts.offsets).to be_an_instance_of(Offsets)
      expect(@shifts.keys.verified_key).to eq('02715')
      expect(@shifts.offsets.verified_date).to eq('040895')
      expect(@shifts.shifts_array).to be_a(Array)
    end

    it "can accept 'random' and 'date today' default value indicator strings" do
      @shifts2 = Shifts.new('random', 'date today')

      expect(@shifts2.keys.verified_key.to_i).to be_an(Integer)
      expect(@shifts2.offsets.verified_date.to_i).to be_an(Integer)
      expect(@shifts2.shifts_array).to be_a(Array)
    end
  end

  describe 'methods' do

    it 'can create a shifts hash' do
      expect(@shifts.shifts_array).to eq([3, 27, 73, 20])
    end
  end
end
