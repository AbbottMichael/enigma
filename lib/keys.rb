class Keys
  attr_reader :key, :verified_key, :keys_hash

  def initialize(key)
    @key = key
    @verified_key = verify_key(@key)
    @keys_hash = {}
  end

  def verify_key(input)
    return input if input == 'random'
    invalid_1 = 'invalid key: must have 5 digits'
    return invalid_1 if input.length != 5
    input_scan = StringScanner.new(input)
    invalid_2 = 'invalid key: only integer values are acceptable'
    return invalid_2 if input_scan.skip(/\d+/) != 5
    input
  end

  def random_key
    string_key = rand(99_999).to_s
    format('%05d', string_key)
  end

  def keys_hash_builder
    @keys_hash.merge!(
      A: (@verified_key[0] + @verified_key[1]).to_i,
      B: (@verified_key[1] + @verified_key[2]).to_i,
      C: (@verified_key[2] + @verified_key[3]).to_i,
      D: (@verified_key[3] + @verified_key[4]).to_i
    )
  end
end
