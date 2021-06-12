require 'rspec'
require 'simplecov'
require './lib/keys.rb'

SimpleCov.start

RSpec.describe Keys do
  describe 'instantiation' do
    before :each do
      @keys = Keys.new(12345)
    end

    it 'exists' do
      expect(@keys).to be_an_instance_of(Keys)
    end

    it 'has readable attributes' do
      expect(@keys.num_5d).to eq(12345)
    end
  end
end
