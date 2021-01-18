require './lib/generator'

module Messages
  include Generatable

  def cleaned_input_message_to_elements(message)
    message.downcase.strip.split("")
  end

  def original_numbers_for_message(message)
    cleaned_input_message_to_elements(message).map do |letter|
      if alphabet_with_index[letter].nil?
        letter
      else
        alphabet_with_index[letter] if alphabet.include?(letter)
      end
    end
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

  def message_to_text(crypt_type)
    message = File.open(ARGV[0], "r").read
    File.open(ARGV[0], "r").close

    crypt = decrypt(message, ARGV[2], ARGV[3]) if crypt_type == "decrypt"
    crypt = encrypt(message, key_generator, date_generator) if crypt_type == "encrypt"

    message_to_screen(crypt)

    File.open(ARGV[1], "w").write(crypt)
    File.open(ARGV[1], "w").close
  end
end
