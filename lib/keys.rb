class Keys
  attr_reader :key, :verified_key, :keys_hash

  def initialize(key)
    @key = key
    @verified_key = verify_key
    @keys_hash = keys_hash_builder
  end

  def verify_key
    return random_key if @key == 'random'
    invalid_1 = 'invalid key: must have 5 digits'
    return invalid_1 if @key.length != 5
    key_scan = StringScanner.new(@key)
    invalid_2 = 'invalid key: only integer values are acceptable'
    return invalid_2 if key_scan.skip(/\d+/) != 5
    @key
  end

  def random_key
    string_key = rand(99_999).to_s
    format('%05d', string_key)
  end

  def keys_hash_builder
    @keys_hash = {
      A: (@verified_key[0] + @verified_key[1]).to_i,
      B: (@verified_key[1] + @verified_key[2]).to_i,
      C: (@verified_key[2] + @verified_key[3]).to_i,
      D: (@verified_key[3] + @verified_key[4]).to_i
    }
  end
end
