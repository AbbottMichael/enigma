require './lib/enigma'

input = ARGV

encrypted_message = File.open(ARGV[0], 'r')

message_to_decrypt = encrypted_message.read

encrypted_message.close

enigma = Enigma.new

decryption = enigma.decrypt(message_to_decrypt, input[2], input[3])

decrypted_message = File.open(ARGV[1], 'w')

decrypted_message.write(decryption[:decryption])

decrypted_message.close

puts "Created '#{ARGV[1]}' with the key #{decryption[:key]}\
 and date #{decryption[:date]}"
