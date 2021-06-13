require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/keys.rb'

RSpec.describe Keys do
  before :each do
    @keys = Keys.new('02715')
  end

  describe 'instantiation' do

    it 'exists' do
      expect(@keys).to be_an_instance_of(Keys)
    end

    it 'has readable attributes' do
      expect(@keys.key).to eq('02715')
      expect(@keys.verified_key).to eq('02715')
      expect(@keys.keys_hash).to eq({:A=>2, :B=>27, :C=>71, :D=>15})
    end
  end

  describe 'methods' do

    it 'can verify the key is in the correct format' do
      expect(@keys.verify_key).to eq('02715')

      keys2 = Keys.new('1234')
      invalid_1 = 'invalid key: must have 5 digits'

      expect(keys2.verify_key).to eq(invalid_1)

      keys3 = Keys.new('random')
      allow(keys3).to receive(:rand).and_return(7329)

      expect(keys3.verify_key).to eq('07329')

      keys4 = Keys.new('78i9u')
      invalid_2 = 'invalid key: only integer values are acceptable'

      expect(keys4.verify_key).to eq(invalid_2)
    end

    it 'can generate a random 5 digit number' do
      allow(@keys).to receive(:rand).and_return(7329)
      expect(@keys.random_key).to eq('07329')
    end

    it 'can return a keys hash' do
      expected = {
        A: 2,
        B: 27,
        C: 71,
        D: 15
      }
      expect(@keys.keys_hash_builder).to eq(expected)
    end
  end
end
