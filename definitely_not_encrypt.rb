require './lib/enigma'

enigma_1 = Enigma.new

enigma_1.run_repl
# def choices
#   puts "\n\n-- Welcome to The Enigma codebreaker.
#   Please choose your option by typing Encrypt or Decrypt into the console,
#   or type Exit -- \n"
#
#   input = gets.downcase.strip
#   if input == "exit"
#     puts "You have chosen exit, goodbye."
#     exit
#   end
#
#   puts "You have chosen #{input}, is that correct?
#       Please type a response, Y/N."
#
#   yes_no1 = gets.downcase.strip
#
#   puts "\n\n"
#
#   if yes_no1 == "n"
#     p "Would you like to try again, Y/N ?"
#     yes_no2 = gets.downcase.strip
#     if yes_no2 == "n"
#       exit
#     else
#       choices
#     end
#   elsif input.include?("encrypt")
#     enigma_1 = Enigma.new
#     enigma_1.message_to_txt("encrypt")
#   elsif input.include?("decrypt")
#     enigma_1 = Enigma.new
#     enigma_1.message_to_txt("decrypt")
#   else
#     puts "\n\n\n++++++++++++++++++++++\n\nLooks like you have entered an invalid search\n\n++++++++++++++++++++++\n\n"
#   end
#   choices
# end


  # choices
