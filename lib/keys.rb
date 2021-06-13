class Keys
  attr_reader :key

  def initialize(key)
    @key = key
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
end
