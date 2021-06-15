require './lib/keys.rb'
require './lib/offsets.rb'

class Shifts
  attr_reader :keys,
              :offsets,
              :shifts_array

  def initialize(keys_input, date_input)
    @keys         = Keys.new(keys_input)
    @offsets      = Offsets.new(date_input)
    @shifts_array = shifts_array_builder
  end

  def shifts_array_builder
    @keys.keys_hash.merge!(@offsets.offsets_hash) do |_, key, offset|
      key + offset
    end.values
  end
end
