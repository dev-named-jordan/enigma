# require './lib/enigma'
#
# class Messages < Enigma
#   def initialize
#
#   end
#
#   def file_read_write
#
#     handle = File.open(ARGV[0], "r")
#
#     message = handle.read
#
#     handle.close
#
#     encrypter = encrypt(message, key, date)
#
#     # decrypt = ''
#
#     writer = File.open(ARGV[1], "w")
#
#     writer.write(encrypter)
#
#     writer.close
#
#   end
#   # ruby runner.rb './data/message_hello_world.txt' './translated/loud_quotes.txt'
# end
