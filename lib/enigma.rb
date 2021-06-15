require './lib/shifts'
require './lib/cipher'

class Enigma

  # def character_set
  #   ('a'..'z').to_a << ' '
  # end

  # def message_array(message)
  #   message.downcase.split('')
  # end

  def encrypt(message, key = 'random', date = 'date today')
    shifts = Shifts.new(key, date)

    {
      encryption: Cipher.new(message, shifts, 'encrypt').output_message,
      key:        shifts.keys.verified_key,
      date:       shifts.offsets.verified_date
    }
  end

  def decrypt(ciphertext, key, date = 'date today')
    shifts = Shifts.new(key, date)

    {
      decryption: Cipher.new(ciphertext, shifts, 'decrypt').output_message,
      key:        shifts.keys.verified_key,
      date:       shifts.offsets.verified_date
    }
  end
end
