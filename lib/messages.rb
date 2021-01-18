require './lib/generator'

class Messages
  include Generatable

  def encrypt_message(message, key, date)
    number_to_encrypted_array(message, key, date).join("")
  end

  def decrypt_message(message, key, date)
    number_to_decrypted_array(message, key, date).join("")
  end

  def message_to_screen(crypt)
    p "Created #{ARGV[1]} with the key #{crypt[:key]} and #{crypt[:date]}"
  end

  def message_to_text(crypt_type)
    handle = File.open(ARGV[0], "r")
    message = handle.read
    handle.close

    crypt = decrypt(message, ARGV[2], ARGV[3]) if crypt_type == "decrypt"
    crypt = encrypt(message, key_generator, date_generator) if crypt_type == "encrypt"

    message_to_screen(crypt)

    writer = File.open(ARGV[1], "w")
    writer.write(crypt)
    writer.close
  end
end
