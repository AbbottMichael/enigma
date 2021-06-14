require './lib/enigma'

message = File.open(ARGV[0], 'r')

message_to_encrypt = message.read

message.close

enigma = Enigma.new

encryption = enigma.encrypt(message_to_encrypt)

ciphertext = File.open(ARGV[1], 'w')

ciphertext.write(encryption[:encryption])

ciphertext.close

puts "Created '#{ARGV[1]}' with the key #{encryption[:key]}\
 and date #{encryption[:date]}"
