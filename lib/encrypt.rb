require './lib/enigma'

message = File.open(ARGV[0], 'r')

message_to_encrypt = message.read

message.close

enigma = Enigma.new

encrypt_details = enigma.encrypt(message_to_encrypt)

ciphertext = File.open(ARGV[1], 'w')

ciphertext.write(encrypt_details[:encryption])

ciphertext.close

puts "Created #{ARGV[1]} with the key #{encrypt_details[:key]}\
 and date #{encrypt_details[:date]}"
