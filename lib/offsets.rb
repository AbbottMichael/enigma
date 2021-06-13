class Offsets
  attr_reader :date, :offsets_hash

  def initialize(date)
    @date = date
    @offsets_hash = {}
  end
end
