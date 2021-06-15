class Cipher
  attr_reader :output_message

  def initialize(message, shifts, type)
    @input_message = message
    @output_message = 'text'
    @shifts = shifts
    @type = type
  end

  def character_set
    ('a'..'z').to_a << ' '
  end

  def message_array(message)
    message.downcase.split('')
  end
end
