require './lib/enigma'

enigma_1 = Enigma.new

enigma_1.message_to_txt("encrypt")

# /Users/jordanbeck/turing/Module_1/enigma $ruby ./lib/encrypt.rb './data/message_hello_world.txt' './translated/encrypted.txt'
# /Users/jordanbeck/turing/Module_1/enigma $ruby ./lib/encrypt.rb './data/message_hello_world_punctuated.txt' './translated/encrypted.txt'
# /Users/jordanbeck/turing/Module_1/enigma $ruby ./lib/encrypt.rb './data/message_to_encrypt.txt' './translated/encrypted.txt'
