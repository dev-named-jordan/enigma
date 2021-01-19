require './test/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @message = "hello world"
    @message_bang = "hello world!"
    @message_bang_new = "keder ohulw!"
    @encrypted_message = "keder ohulw"
    @encrypted_message_for_160121 = "nkfaufqdxry"
    @message2 = './data/message_hello_world'
    @message3 = './data/message_to_encrypt'
    @user_key = "02715"
    @user_key1 = "02716"
    @user_key2 = "02717"
    @user_date = "040895"
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_clean_input
    assert_equal ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], @enigma.cleaned_input_message_to_elements(@message)
  end

  def test_sub_key_with_index
    expected = { 02 => 0,  27 => 1,  71 => 2,  15 => 3 }

    assert_equal expected, @enigma.sub_key_with_index(@user_key)
  end

  def test_key_as_elements
    assert_equal ["0", "2", "7", "1", "5"], @enigma.key_as_elements(@user_key)
  end

  def test_date_to_offset_elements
    assert_equal [1, 0, 2, 5], @enigma.date_to_offset_elements(@user_date)
  end

  def test_create_shift_values
    assert_equal [3, 27, 73, 20], @enigma.create_shift_values(@user_key, @user_date)
  end

  def test_original_numbers_for_message
    assert_equal [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3], @enigma.original_numbers_for_message(@message)
    assert_equal [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3, "!"], @enigma.original_numbers_for_message(@message_bang)
  end

  def test_number_to_crypted_array
    assert_equal ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"], @enigma.number_to_encrypted_array(@message, @user_key, @user_date)
    assert_equal ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w", "!"], @enigma.number_to_encrypted_array(@message_bang, @user_key, @user_date)
    assert_equal ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], @enigma.number_to_decrypted_array(@encrypted_message, @user_key, @user_date)
    assert_equal ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "!"], @enigma.number_to_decrypted_array(@message_bang_new, @user_key, @user_date)
  end

  def test_crypt_with_user_input
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
  end

  def test_encrypt_with_stubs
    encrypted = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
      }
      
    Enigma.any_instance.stubs(:encrypt).returns(encrypted)

    assert_equal encrypted, @enigma.encrypt(@message)
  end

  def test_random_key
    assert(@enigma.key_generator.to_i.between?(0, 99999))

    random_key = mock

    Enigma.any_instance.stubs(:key_generator).returns(random_key)

    assert_equal random_key, @enigma.key_generator
  end
end
