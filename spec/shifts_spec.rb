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
      expect(@shifts.keys).to eq('random')
      expect(@shifts.date).to eq('todays date')
    end
  end
end
