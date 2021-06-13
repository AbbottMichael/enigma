require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/shifts.rb'
require './lib/enigma.rb'

RSpec.describe Enigma do

  describe 'instantiation' do
    before :each do
      @enigma = Enigma.new
    end

    it 'exists' do
      expect(@enigma).to be_an_instance_of(Enigma)
    end

    it 'has readable attributes' do
      expected = [
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
        'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
        'y', 'z', ' '
      ]
      expect(@enigma.character_set).to eq(expected)
    end
  end
end
