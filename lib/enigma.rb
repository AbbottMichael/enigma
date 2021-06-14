class Enigma
  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
    @shift_count = [0,1,2,3]
  end

  def encryption(message, key, date)
    shifts = Shifts.new(key, date)
    message_array = message.downcase.split('')
    counter = -1
    message_array.map do |letter|
      counter += 1
      index_value = @character_set.find_index(message_array[counter])
      next message_array[counter] if index_value == nil
      shift_position = @shift_count.rotate(counter)
      shift = shifts.shifts_hash.values[shift_position[0]]
      shifted_char_set = @character_set.rotate(shift)
      shifted_char_set[index_value]
    end.join
  end
end
