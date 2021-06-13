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

  describe 'methods' do

    it 'can verify the date input is in the correct format' do
      expect(@offsets.verify_date(@offsets.date)).to eq('040895')

      @offsets2 = Offsets.new('todays date')

      expect(@offsets2.verify_date(@offsets2.date)).to eq('todays date')

      @offsets3 = Offsets.new('04089')
      invalid_1 = 'invalid date: must have 6 digits'

      expect(@offsets3.verify_date(@offsets3.date)).to eq(invalid_1)

      @offsets4 = Offsets.new('Four_eight_ninety_five')
      invalid_2 = 'invalid date: only integer values are acceptable'

      expect(@offsets4.verify_date(@offsets4.date)).to eq(invalid_2)
    end
  end
end
