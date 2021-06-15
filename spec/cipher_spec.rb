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

  describe 'methods' do

    it 'can generate the character_set' do
      expected = [
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
        'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
        'y', 'z', ' '
      ]

      expect(@cipher.character_set).to eq(expected)
    end

    it 'can generate a message array' do
      expected = [ 'h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd']

      expect(@cipher.message_array('Hello World')).to eq(expected)
    end
  end
end
