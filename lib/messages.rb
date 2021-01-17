require './lib/generator'
require './lib/enigma_repl'

class Messages

  include Generator
  include Repl

  # def initialize
  # end
  def run_repl
    choices
  end

  def message_to_screen(crypt)
     p crypt
    # file = File.open("users.txt")
    # file_data = file.read
    # file_data = file.readlines.map(&:chomp)
    # './translated/encrypted.txt'
    # require "pry"; binding.pry
    # p "Created with the key 82648 and date 240818"
    # p './translated/encrypted.txt'
    # {:encryption=>"wpcicknlfwv", :key=>"65950", :date=>"160121"}
    # file.close
  end

  def message_to_txt(crypt_type)
    handle = File.open(ARGV[0], "r")
    message = handle.read
    handle.close

    crypt = decrypt(message, key_generator, date_generator) if crypt_type == "decrypt"

    crypt = encrypt(message, key_generator, date_generator) if crypt_type == "encrypt"

    puts "\n\n\n"

    message_to_screen(crypt)

    puts  "\n"

    writer = File.open(ARGV[1], "w")
    writer.write(crypt)
    writer.close
  end

#   $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818
# $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
# Created 'decrypted.txt' with the key 82648 and date 240818

#   # ruby encrypt.rb './data/message_hello_world.txt' './translated/encrypted.txt'
end
