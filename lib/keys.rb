class Keys
  attr_reader :key

  def initialize(key)
    @key = key
  end

  def verify_key(input)
    return input if input == 'random'
    input.is_a?(Integer) && input.to_s.length == 5 ?
      input.to_s : 'invalid'
  end

  def random_key
    string_key = rand(99_999).to_s
    format('%05d', string_key)
  end
end
