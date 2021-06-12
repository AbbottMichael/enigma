require 'rspec'
require 'simplecov'
require './lib/keys.rb'

SimpleCov.start

RSpec.describe Keys do
  before :each do
    @keys = Keys.new(12345)
  end

  describe 'instantiation' do

    it 'exists' do
      expect(@keys).to be_an_instance_of(Keys)
    end

    it 'has readable attributes' do
      expect(@keys.key).to eq(12345)
    end
  end

  describe 'methods' do

    it 'can verify the key is in the correct format' do
      expect(@keys.verify_key(@keys.key)).to eq(12345)

      keys2 = Keys.new(1234)

      expect(keys2.verify_key(keys2.key)).to eq('invalid')
    end
  end
end
