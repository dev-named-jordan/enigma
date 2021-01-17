require './lib/generator'
require './lib/enigma_repl'
require './lib/crypt'

class Messages
  include Generatable
  include Cryptable
  include Repl

  def run_repl
    choices
  end

  def encrypt_message(message, key, date)
    number_to_encrypted_array(message, key, date).join("")
  end

  def decrypt_message(message, key, date)
    number_to_decrypted_array(message, key, date).join("")
  end

  def message_to_screen(crypt)
    p "Created #{ARGV[1]} with the key #{crypt[:key]} and #{crypt[:date]}"
  end

  def message_to_txt(crypt_type)
    handle = File.open(ARGV[0], "r")
    message = handle.read
    handle.close

    if crypt_type == "decrypt"
      crypt = decrypt(message, ARGV[2], ARGV[3])
    elsif crypt_type == "encrypt"
      crypt = encrypt(message, key_generator, date_generator)
    end

    puts "\n\n\n"
    message_to_screen(crypt)
    puts  "\n"

    writer = File.open(ARGV[1], "w")
    writer.write(crypt)
    writer.close
  end
end
