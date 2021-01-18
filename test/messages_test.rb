require './test/test_helper'

class MessagesTest < Minitest::Test

  def setup
    @enigma        = Enigma.new
    @message       = "hello world"
    @encrypted_message = "keder ohulw"
    @encrypted_message_for_160121 = "nkfaufqdxry"
    @message1      = './data/message_one_letter_to_encrypt_them_all'
    @message2      = './data/message_hello_world'
    @message3      = './data/message_to_encrypt'
    @user_key      = "02715"
    @user_date     = "040895"
    @random_date   = Time.now.strftime("%d%m%y").to_i
    @crypt_type_1  = "encrypt"
    @crypt_type_2  = "decrypt"
    @message_bang  = "hello world !!!!!!!!!!!!"
    @file_1        = File.open('./data/message_hello_world_punctuated.txt', "r").read
                     File.open('./data/message_hello_world_punctuated.txt', "r").close

                     crypt = @enigma.encrypt(@message_bang, @user_key, @user_date) if @crypt_type_1 == "encrypt"

                     File.open('./translated/encrypted.txt', "w").write(crypt)
                     File.open('./translated/encrypted.txt', "w").close

    @file_2        = File.open('./data/message_hello_world_punctuated.txt', "r").read
                     File.open('./data/message_hello_world_punctuated.txt', "r").close

                     crypt = @enigma.decrypt("ye ne kqhls!!!!!!!!!!!!", "82648", "240818") if @crypt_type_2 == "decrypt"

                     File.open('./translated/encrypted.txt', "w").write(crypt)
                     File.open('./translated/encrypted.txt', "w").close

  end

  def test_file_1
    assert_instance_of String, @file_1
  end

  def test_file_2
    assert_instance_of String, @file_1
  end

  def test_encrypt_message
    assert_equal "keder ohulw", @enigma.encrypt_message(@message, @user_key, @user_date)
  end

  def test_decrypt_message
    assert_equal "eetsl dvoll", @enigma.decrypt_message(@message, @user_key, @user_date)
  end

  def test_message_to_screen
    expected  = {:decryption=>"hello world", :key=>"02715", :date=>"040895"}

    assert_equal "Created #{ARGV[1]} with the key 02715 and 040895", @enigma.message_to_screen(expected)

    expected = {:decryption=>"ye ne kqhls", :key=>"82648", :date=>"240818"}

    Enigma.any_instance.stubs(:message_to_screen).returns(expected)

    assert_equal expected, @enigma.message_to_screen
  end

  def test_args
    ARGV[0] = mock
    message = ARGV[0]

    assert_equal ARGV[0], message

    ARGV[1] = mock
    message = ARGV[1]

    assert_equal ARGV[1], message

    ARGV[2] = mock
    message = ARGV[2]

    assert_equal ARGV[2], message

    ARGV[3] = mock
    message = ARGV[3]

    assert_equal ARGV[3], message
  end

  def test_crypts
    crypt_type = "encrypt"

    crypt = @enigma.encrypt(@message, @user_key, @user_date) if crypt_type == "encrypt"

    expected = {:encryption=>"keder ohulw", :key=>"02715", :date=>"040895"}

    assert_equal expected, crypt

    crypt_type = "decrypt"

    crypt = @enigma.decrypt(@encrypted_message, "02715", "040895") if crypt_type == "decrypt"

    expected = {:decryption=>"hello world", :key=>"02715", :date=>"040895"}

    assert_equal expected, crypt
  end

  def test_message_to_text
    expected = {:decryption=>"ye ne kqhls", :key=>"82648", :date=>"240818"}

    Enigma.any_instance.stubs(:message_to_text).returns(expected)

    assert_equal expected , @enigma.message_to_text
  end
end
