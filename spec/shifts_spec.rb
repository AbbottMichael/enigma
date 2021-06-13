require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/keys.rb'
require './lib/offsets.rb'
require './lib/shifts.rb'

RSpec.describe Shifts do

  describe 'instantiation' do
    before :each do
      @shifts = Shifts.new
    end

    it 'exists' do
      expect(@shifts).to be_an_instance_of(Shifts)
    end

    it 'has readable default attributes' do
      expect(@shifts.keys).to be_an_instance_of(Keys)
      expect(@shifts.offsets).to be_an_instance_of(Offsets)
      expect(@shifts.keys.key).to eq('random')
      expect(@shifts.offsets.date).to eq('todays date')
    end

    it 'has readable attributes' do
      @shifts2 = Shifts.new('02715', '040895')

      expect(@shifts2.keys).to be_an_instance_of(Keys)
      expect(@shifts2.offsets).to be_an_instance_of(Offsets)
      expect(@shifts2.keys.key).to eq('02715')
      expect(@shifts2.offsets.date).to eq('040895')
    end
  end

  describe 'methods' do
    before :each do
      @shifts2 = Shifts.new('02715', '040895')
    end

    it 'can create a shifts hash' do
      expected = {
        A: 3,
        B: 27,
        C: 73,
        D: 20
      }
      expect(@shifts2.shifts_hash).to eq(expected)
    end
  end
end
