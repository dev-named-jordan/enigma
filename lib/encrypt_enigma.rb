require './lib/messages'
require './lib/crypt'
require 'date'
require 'time'

class Encrypt < Enigma
  include Cryptable
  def initialize(message, key = key_generator, date = date_generator)
    # @crypt = Hash.new(0)
    @crypt[:encryption] = encrypt_message(message, key, date)
  end
end 
