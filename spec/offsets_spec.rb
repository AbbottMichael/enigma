require 'simplecov'
SimpleCov.start
require 'time'
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
      expect(@offsets.verified_date).to eq('040895')
      expect(@offsets.processed_date).to eq('1025')
      expect(@offsets.offsets_hash).to eq({:A=>1, :B=>0, :C=>2, :D=>5})
    end

  end

  describe 'methods' do

    it 'can verify the date input is in the correct format' do

      time = Time.parse('2021-06-13')
      allow(Time).to receive(:new).and_return(time)

      @offsets2 = Offsets.new('date today')

      expect(@offsets2.verify_date).to eq("130621")

      @offsets3 = Offsets.new('04089')
      invalid_1 = 'invalid date: must have 6 digits'

      expect(@offsets3.verify_date).to eq(invalid_1)

      @offsets4 = Offsets.new('04O895')
      invalid_2 = 'invalid date: only integer values are acceptable'

      expect(@offsets4.verify_date).to eq(invalid_2)
      expect(@offsets.verify_date).to eq('040895')
    end

    it 'can return todays date in the correct format' do
      time = Time.parse('2021-06-13')
      allow(Time).to receive(:new).and_return(time)

      expect(@offsets.date_today).to eq('130621')
    end

    it 'can square and return the last 4 digits of date' do
      expect(@offsets.process_date).to eq('1025')

      @offsets3 = Offsets.new('04089')

      expect(@offsets3.process_date).to eq('0000')
    end

    it 'can create an offsets hash' do
      expected = {
        A: 1,
        B: 0,
        C: 2,
        D: 5
      }
      expect(@offsets.offsets_hash_builder).to eq(expected)
    end
  end
end
