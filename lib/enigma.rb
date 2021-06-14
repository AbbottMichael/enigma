require './lib/shifts'

class Enigma

  def character_set
    ('a'..'z').to_a << ' '
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
    shift = shifts.shifts_hash.values
    message_array.map do |letter|
      next letter if character_set.find_index(letter) == nil
      shifted_char_set = character_set.rotate(shift.rotate![-1])
      shifted_char_set[character_set.find_index(letter)]
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
    shift = shifts.shifts_hash.values
    ciphertext_array.map do |letter|
      next letter if character_set.find_index(letter) == nil
      shifted_char_set = character_set.rotate(-shift.rotate![-1])
      shifted_char_set[character_set.find_index(letter)]
    end.join
  end
end
