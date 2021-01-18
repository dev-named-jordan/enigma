require './lib/messages'
require './lib/crypt'

class Enigma
# class Enigma < Messages
  include Cryptable
  include Messages

  def encrypt(message, key = key_generator, date = date_generator)
    expected = Hash.new(0)
    expected[:encryption] = encrypt_message(message, key, date)
    expected[:key] = key
    expected[:date] = date
    expected
  end

  def decrypt(message, key = key_generator, date = date_generator)
    expected = Hash.new(0)
    expected[:decryption] = decrypt_message(message, key, date)
    expected[:key] = key
    expected[:date] = date
    expected
  end
end
