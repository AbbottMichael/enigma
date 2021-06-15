require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/shifts.rb'
require './lib/enigma.rb'
require './lib/cipher.rb'

RSpec.describe Cipher do
  before :each do
    @shifts = Shifts.new('02715', '040895')
    @cipher = Cipher.new('Hello World', @shifts, 'encrypt')
  end

  describe 'instantiation' do

    it 'exists' do
      expect(@cipher).to be_an_instance_of(Cipher)
    end

    it 'has readable attributes' do
      expect(@cipher.output_message).to eq('text')
    end
  end
end
