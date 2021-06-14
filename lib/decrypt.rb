require './lib/enigma'

abort("ERROR: You must provide a message to decrypt: <file.txt>\n") if ARGV[0] == nil

abort("ERROR: You must provide a file to write the decrypted message to: <file.txt>\n") if ARGV[1] == nil

abort("ERROR: You must provide the key used to encrypt the message: <12345>\n") if ARGV[2] == nil

abort("ERROR: You must provide the date used to encrypt the message: <DDMMYY>\n") if ARGV[3] == nil

encrypted_message = File.open(ARGV[0], 'r')

message_to_decrypt = encrypted_message.read

encrypted_message.close

enigma = Enigma.new

decryption = enigma.decrypt(message_to_decrypt, ARGV[2], ARGV[3])

abort(decryption[:key]) if decryption[:key].include? 'INVALID'

abort(decryption[:date]) if decryption[:date].include? 'INVALID'

decrypted_message = File.open(ARGV[1], 'w')

decrypted_message.write(decryption[:decryption])

decrypted_message.close

puts "Created '#{ARGV[1]}' with the key #{decryption[:key]}\
 and date #{decryption[:date]}"
