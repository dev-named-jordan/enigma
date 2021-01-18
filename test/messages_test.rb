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

  # def test_message_to_screen
  #   # # require "pry"; binding.pry
  #   # message_to_screen = mock
  #   # # assert_equal "ucalmadzk,pwmrqa'hpvnftzkolovhpgaoeeaadgr!", @enigma.message_to_screen(@message3, "63667", "17012")
  #   # assert_equal "", @enigma.message_to_screen("")
  #   #
  #   # crypt_mock = mock
  #   #
  #   # assert_equal "", enigma_mock.message_to_screen(crypt_mock)
  # end
  #
  # def test_message_to_text
  #
  # end
end
