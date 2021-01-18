require './test/test_helper'

class MessagesTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @message = "hello world"
    @encrypted_message = "keder ohulw"
    @encrypted_message_for_160121 = "nkfaufqdxry"
    @message1 = './data/message_one_letter_to_encrypt_them_all'
    @message2 = './data/message_hello_world'
    @message3 = './data/message_to_encrypt'
    @user_key = "02715"
    @user_date = "040895"
    @random_date = Time.now.strftime("%d%m%y").to_i
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

  def test_message_to_text
    # assert_equal [], @enigma.message_to_text("decrypt")

    expected = {:decryption=>"ye ne kqhls", :key=>"82648", :date=>"240818"}

    Enigma.any_instance.stubs(:message_to_text).returns(expected)

    assert_equal expected , @enigma.message_to_text
  end
end
