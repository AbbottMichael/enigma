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

  def algorithm(message, shifts, type)
    message_array(message).map do |letter|
      next letter if character_set.find_index(letter) == nil
      shift_num = (type == 'decrypt') ? (-shifts.shifts_array.rotate![-1]) :
        (shifts.shifts_array.rotate![-1])
      shifted_char_set = character_set.rotate(shift_num)
      shifted_char_set[character_set.find_index(letter)]
    end.join
  end
end
