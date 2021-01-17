require './lib/enigma'

enigma_1 = Enigma.new

enigma_1.message_to_txt("decrypt")

# $ruby ./lib/decrypt.rb './data/message_hello_world.txt' './translated/decrypted.txt' 82648 240818
