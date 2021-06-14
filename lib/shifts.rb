require './lib/keys.rb'
require './lib/offsets.rb'

class Shifts
  attr_reader :keys, :offsets, :shifts_hash

  def initialize(keys_input, date_input)
    @keys = Keys.new(keys_input)
    @offsets = Offsets.new(date_input)
    @shifts_hash = shifts_hash_builder
  end

  def shifts_hash_builder
    @keys.keys_hash.merge!(@offsets.offsets_hash) do |_, key, offset|
      key + offset
    end
  end
end
