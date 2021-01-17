require './test/test_helper'

class GeneratorTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @message = "hello world"
    @encrypted_message = "keder ohulw"
    @encrypted_message_for_160121 = "nkfaufqdxry"
    @message1 = './data/message_one_letter_to_encrypt_them_all'
    @message2 = './data/message_hello_world'
    @message3 = './data/message_to_encrypt'
    @user_key = "02715"
    @random_key = ""
    @user_date = "040895"
    @random_date = Time.now.strftime("%d%m%y")
  end

  def test_alphabet
  end

  def test_date_generator
    
  end

  def test_key_generator
    assert(@enigma.key_generator.to_i.between?(0, 99999))

    random_key = mock

    Enigma.any_instance.stubs(:key_generator).returns(random_key)

    assert_equal random_key, @enigma.key_generator
  end
end
