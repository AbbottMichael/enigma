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
      expect(@keys.key).to eq(12345)
    end
  end

  describe 'methods' do
    it 'can verify the key is in the correct format' do
      expect(verify_key(@key)).to eq(12345)

      @key = 1234

      expect(verify_key(@key)).to eq('invalid')
    end
  end
end
