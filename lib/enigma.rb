require './lib/messages'
require './lib/crypt'
require 'date'
require 'time'

class Enigma < Messages

  include Crypt

  attr_reader :key, :date

  def initialize(message, key = key_generator, date = date_generator)
    @crypt = Hash.new(0)
    @crypt[:encryption] = encrypt_message(message, key, date)
    @crypt[:decryption] = decrypt_message(message, key, date)
    @key = crypt[:key]
    @date = crypt[:date]
    def encrypt(message, key = key_generator, date = date_generator)
  end

    def decrypt(message, key = key_generator, date = date_generator)
      expected = Hash.new(0)
      expected[:encryption] = encrypt_message(message, key, date)
      expected[:decryption] = decrypt_message(message, key, date)
      expected[:key] = key
      expected[:date] = date
      expected
    end
  end

  # def encrypt(message, key = key_generator, date = date_generator)
  #   expected = Hash.new(0)
  #   expected[:encryption] = encrypt_message(message, key, date)
  #   expected[:key] = key
  #   expected[:date] = date
  #   expected
  # end
  #
  # def decrypt(message, key = key_generator, date = date_generator)
  #   expected = Hash.new(0)
  #   expected[:decryption] = decrypt_message(message, key, date)
  #   expected[:key] = key
  #   expected[:date] = date
  #   expected
  # end
end
