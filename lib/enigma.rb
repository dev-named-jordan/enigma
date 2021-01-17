require 'date'
require 'time'
require './lib/messages'
require './lib/crypt'

class Enigma < Messages
  include Cryptable

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

#   include Encrypt
#   include Decrypt
#   attr_reader :key, :date
#
#   def initialize(message, key = key_generator, date = date_generator)
#     @crypt = Hash.new(0)
#     @key = crypt[:key]
#     @date = crypt[:date]
#     # encrypt(message, key = key_generator, date = date_generator)
#   end
# end
