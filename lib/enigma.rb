require './lib/shifts'

class Enigma

  def character_set
    ('a'..'z').to_a << ' '
  end

  def message_array(message)
    message.downcase.split('')
  end

  def encrypt(message, key = 'random', date = 'date today')
    shifts = Shifts.new(key, date)

    {
      encryption: cipher(message, shifts, 'encrypt'),
      key:        shifts.keys.verified_key,
      date:       shifts.offsets.verified_date
    }
  end

  def decrypt(ciphertext, key, date = 'date today')
    shifts = Shifts.new(key, date)

    {
      decryption: cipher(ciphertext, shifts, 'decrypt'),
      key:        shifts.keys.verified_key,
      date:       shifts.offsets.verified_date
    }
  end

  def cipher(message, shifts, type)
    message_array(message).map do |letter|
      next letter if character_set.find_index(letter) == nil
      shift_num = (type == 'decrypt') ? (-shifts.shifts_array.rotate![-1]) :
        (shifts.shifts_array.rotate![-1])
      shifted_char_set = character_set.rotate(shift_num)
      shifted_char_set[character_set.find_index(letter)]
    end.join
  end
end
