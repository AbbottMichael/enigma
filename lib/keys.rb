class Keys
  attr_reader :key

  def initialize(key)
    @key = key
  end

  def verify_key(input)
    return input if input == 'random'
    input.is_a?(Integer) && input.to_s.length == 5 ?
      input : 'invalid'
  end
end
