  require './lib/generator'

module Cryptable
  def date_to_offset_elements(date)
    squared = (date.to_i ** 2)
    squared.to_s[-4..-1].to_i.digits.reverse
  end

  def key_as_elements(key)
    key.chars
  end

  def sub_key_with_index(key)
    elements_sub_key_array = []
    key_as_elements(key).each_cons(2) { |element| elements_sub_key_array.push(element) }
    joined_sub_key_array = elements_sub_key_array.flat_map { |sub_array| sub_array.join }
    key_with_index = Hash.new
    joined_sub_key_array.each_with_index { |sub_key_element, index| key_with_index[sub_key_element.to_i] = index }
    key_with_index
  end

  def create_shift_values(key, date)
    sub_keys_array = sub_key_with_index(key).keys
    date_offset_array = date_to_offset_elements(date)
    compared = [sub_keys_array, date_offset_array]
    compared.transpose.map(&:sum)
  end

  def alphabet_with_index
    alphabet_with_index = Hash.new
    alphabet.each_with_index do |letter_element, index|
      alphabet_with_index[letter_element] = index
    end
    alphabet_with_index
  end

  def number_to_decrypted_array(message, key, date)
    message_element_array = []
    original_numbers_for_message(message).each_with_index do |number, index|
      unless number.nil? || (number.class != Integer && (number != " "))
        message_element_array.push(alphabet.rotate(number).rotate(-(create_shift_values(key, date).rotate(index)).first).first)
      end
      message_element_array << number if number.nil? || (number.class != Integer && (number != " "))
    end
    message_element_array
  end

  def number_to_encrypted_array(message, key, date)
    message_element_array = []
    original_numbers_for_message(message).each_with_index do |number, index|
      unless number.nil? || (number.class != Integer && (number != " "))
        message_element_array.push(alphabet.rotate(number).rotate(create_shift_values(key, date).rotate(index).first).first)
      end
      message_element_array << number if number.nil? || (number.class != Integer && (number != " "))
    end
    message_element_array
  end
end
