class Shifts
  attr_reader :keys, :offsets

  def initialize(keys_input = 'random', date_input = 'todays date')
    @keys = Keys.new(keys_input)
    @offsets = Offsets.new(date_input)
  end
end
