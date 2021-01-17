require './test/test_helper'

class EnigmaTest < Minitest::Test

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

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt_with_user_input
    assert_equal ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], @enigma.cleaned_input_message_to_elements(@message)

    expected = { 02 => 0,  27 => 1,  71 => 2,  15 => 3 }

    assert_equal expected, @enigma.sub_key_with_index(@user_key)
    assert_equal ["0", "2", "7", "1", "5"], @enigma.key_as_elements(@user_key)
    assert_equal [1, 0, 2, 5], @enigma.date_to_offset_elements(@user_date)

    expected = {"a"=>0, "b"=>1, "c"=>2, "d"=>3, "e"=>4, "f"=>5, "g"=>6, "h"=>7, "i"=>8, "j"=>9, "k"=>10, "l"=>11, "m"=>12, "n"=>13, "o"=>14, "p"=>15, "q"=>16, "r"=>17, "s"=>18, "t"=>19, "u"=>20, "v"=>21, "w"=>22, "x"=>23, "y"=>24, "z"=>25, " "=>26}

    assert_equal expected, @enigma.alphabet_with_index
    assert_equal [3, 27, 73, 20], @enigma.create_shift_values(@user_key, @user_date)
    assert_equal [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3], @enigma.original_numbers_for_message(@message)
    assert_equal ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"], @enigma.number_to_encrypted_array(@message, @user_key, @user_date)
    assert_equal ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], @enigma.number_to_decrypted_array(@encrypted_message, @user_key, @user_date)
    assert_equal "keder ohulw", @enigma.encrypt_message(@message, @user_key, @user_date)

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      }


    assert_equal expected, @enigma.encrypt(@message, @user_key, @user_date)

    expected = {
    decryption: "hello world",
    key: "02715",
    date: "040895"
    }

    assert_equal expected, @enigma.decrypt(@encrypted_message, @user_key, @user_date)

    encrypted = {
      encryption: "nkfaufqdxry",
      key: "02715",
      date: Time.now.strftime("%d%m%y")
    }

    assert_equal encrypted, @enigma.encrypt(@message, @user_key)

    decrypted = {
      decryption: "hello world",
      key: "02715",
      date: Time.now.strftime("%d%m%y")
    }

    assert_equal decrypted, @enigma.decrypt(@encrypted_message_for_160121, @user_key)
    assert_equal decrypted, @enigma.decrypt(encrypted[:encryption], @user_key)

    # :mock_encryption = mock
    # :mock_key = mock
    # :mock_date = mock
    # encrypted = mock
    #
    encrypted = {
      # @mock_key,
      encryption: @mock_encryption,
      # @mock_key,
      key: @mock_key,
      # @mock_date
      date: @mock_date
    }
    #
    # assert_equal encrypted, @enigma.encrypt(@message)
    #
    Enigma.any_instance.stubs(:encrypt).returns(encrypted)

    assert_equal encrypted, @enigma.encrypt(@message)
    assert(@enigma.key_generator.to_i.between?(0, 99999))

    random_key = mock

    Enigma.any_instance.stubs(:key_generator).returns(random_key)

    assert_equal random_key, @enigma.key_generator
  end
end
