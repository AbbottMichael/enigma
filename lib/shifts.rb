class Shifts
  attr_reader :keys, :offsets, :shifts_hash

  def initialize(keys_input = 'random', date_input = 'date today')
    @keys = Keys.new(keys_input)
    @offsets = Offsets.new(date_input)
    @shifts_hash = shifts_hash_builder
  end

  def shifts_hash_builder
    @keys.keys_hash.merge!(@offsets.offsets_hash) do |letter, key, offset|
      key + offset
    end
  end
end
