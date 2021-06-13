class Shifts
  attr_reader :keys, :offsets

  def initialize(keys_input = 'random', date_input = 'todays date')
    @keys = Keys.new(keys_input)
    @offsets = Offsets.new(date_input)
  end

  def shifts_hash_builder
    @keys.keys_hash.merge!(@offsets.offsets_hash) do |letter, key_val, offset_val|
      key_val + offset_val
    end
  end
end
