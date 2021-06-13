require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/offsets.rb'

RSpec.describe Offsets do
  before :each do
    @offsets = Offsets.new('040895')
  end

  describe 'instantiation' do

    it 'exists' do
      expect(@offsets).to be_an_instance_of(Offsets)
    end

    it 'has readable attributes' do
      expect(@offsets.date).to eq('040895')
      expect(@offsets.offsets_hash).to eq({})
    end

  end
end
