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
  end
end
