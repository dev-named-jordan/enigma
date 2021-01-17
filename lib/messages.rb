# require './lib/enigma'

class Messages
# class Messages < Enigma
  def initialize

  end

  def date_generator
    Time.now.strftime("%d%m%y")
  end

  def key_generator
    (0..99999).to_a.sample.to_s.rjust(5, "0")[0..4]
  end

  def file_read_write

    handle = File.open(ARGV[0], "r")

    message = handle.read

    handle.close

    encrypter = encrypt(message, key_generator, date_generator)

    # decrypt = ''

    writer = File.open(ARGV[1], "w")

    writer.write(encrypter)

    writer.close

  end
#   # ruby encrypt.rb './data/message_hello_world.txt' './translated/loud_quotes.txt'
end
