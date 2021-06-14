class Enigma
  attr_reader :character_set

  def initialize
    @character_set = ('a'..'z').to_a << ' '
  end

  def encrypt(message, key = 'random', date = 'date today')
    shifts = Shifts.new(key, date)
    {
      :encryption => encryption(message, shifts),
      :key => shifts.keys.verified_key,
      :date => shifts.offsets.verified_date
    }
  end

  def encryption(message, shifts)
    message_array = message.downcase.split('')
    position_count = -1
    message_array.map do |letter|
      position_count += 1
      index_value = @character_set.find_index(letter)
      next letter if index_value == nil
      shift = shifts.shifts_hash.values.rotate(position_count)
      shifted_char_set = @character_set.rotate(shift[0])
      shifted_char_set[index_value]
    end.join
  end

  def decrypt(ciphertext, key, date = 'date today')
    shifts = Shifts.new(key, date)
    {
      :decryption => decryption(ciphertext, shifts),
      :key => shifts.keys.verified_key,
      :date => shifts.offsets.verified_date
    }
  end

  def decryption(ciphertext, shifts)
    ciphertext_array = ciphertext.downcase.split('')
    position_count = -1
    ciphertext_array.map do |letter|
      position_count += 1
      index_value = @character_set.find_index(letter)
      next letter if index_value == nil
      shift = shifts.shifts_hash.values.rotate(position_count)
      shifted_char_set = @character_set.rotate(-shift[0])
      shifted_char_set[index_value]
    end.join
  end
end
