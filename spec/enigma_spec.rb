require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/shifts.rb'
require './lib/enigma.rb'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end

  describe 'instantiation' do

    it 'exists' do
      expect(@enigma).to be_an_instance_of(Enigma)
    end
  end

  describe 'methods' do

    it 'can return an encryption hash' do
      expected = {
        encryption: 'keder ohulw',
        key:        '02715',
        date:       '040895'
      }
      expect(@enigma.encrypt('Hello world', '02715', '040895')).to eq(expected)
    end

    it 'can return a decryption hash' do
      expected = {
        decryption: 'hello world',
        key:        '02715',
        date:       '040895'
      }
      expect(@enigma.decrypt('keder ohulw', '02715', '040895')).to eq(expected)
    end

    it 'can encrypt a message with a key; no provided date' do
      encrypted = @enigma.encrypt('Hello world', '02715')

      expect(encrypted[:date]).to be_a(String)
    end

    it 'can decrypt a message with a key; no provided date' do
      decrypted = @enigma.decrypt('okfavfqdyry', '02715')

      expect(decrypted[:date]).to be_a(String)
    end

    it 'can encrypt a message with no key or date provided' do
      encrypted = @enigma.encrypt('hello world')

      expect(encrypted[:key]).to be_a(String)
      expect(encrypted[:date]).to be_a(String)
    end
  end
end
