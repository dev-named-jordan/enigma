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

  def test_alphabet_with_index
    expected = {"a"=>0, "b"=>1, "c"=>2, "d"=>3, "e"=>4, "f"=>5, "g"=>6, "h"=>7, "i"=>8, "j"=>9, "k"=>10, "l"=>11, "m"=>12, "n"=>13, "o"=>14, "p"=>15, "q"=>16, "r"=>17, "s"=>18, "t"=>19, "u"=>20, "v"=>21, "w"=>22, "x"=>23, "y"=>24, "z"=>25, " "=>26}

    assert_equal expected, @enigma.alphabet_with_index
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
