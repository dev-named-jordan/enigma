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
    @user_date = "040895"
    @random_date = Time.now.strftime("%d%m%y")
  end

  def test_alphabet
    assert_equal ["a",
 "b", "c", "d", "e", "f", "g", "h", "i",
 "j", "k", "l", "m", "n", "o", "p", "q",
 "r", "s", "t", "u", "v", "w", "x", "y",
 "z", " "], @enigma.alphabet
  end

  def test_date_generator
    random_date = mock

    Enigma.any_instance.stubs(:date_generator).returns(random_date)

    assert_equal random_date, @enigma.date_generator
  end

  def test_key_generator
    assert(@enigma.key_generator.to_i.between?(0, 99999))

    random_key = mock

    Enigma.any_instance.stubs(:key_generator).returns(random_key)

    assert_equal random_key, @enigma.key_generator
  end
end
