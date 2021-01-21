
https://github.com/jordanfbeck0528/enigma


#3 on Functionality

- Iteration 4 not attempted. All "extra" time spent focusing on refactoring,
 and raising test coverage. Enigma Class with encrypt and decrypt methods successfully
 implemented. Encrypt/decrypt command line interfaces successfully implemented.

#3.5 on OOP

- There is a real chance I am mis-understanding a few things. But, I think I have done
 a good job of whiteboarding out 1 main class, moving to modules. I started by going from One class, to two classes - with inheritance, to 2 classes -  with two modules, to finally, 1 class - with 3 modules. My modules feel to me, like they represent specific behavior and functionality, close to what I initially whiteboarded.

 - Messagable - handles all message and user
 input related command line messages,
 - Generatable - handles the alphabet, date and random_key generators.
 - and Cryptable - which, handles the bulk of the algorithm logic.

 - To use these modules with my pre-made text files, in my data_folder, the user can input one of the following commands into the terminal from the enigma root, each will create a different text file from it's ARGV[0] and writing the new file to ARGV[1]  -

  $ruby ./lib/encrypt.rb './data/message_hello_world.txt' './translated/encrypted.txt'

  $ruby ./lib/encrypt.rb './data/message_hello_world_punctuated.txt' './translated/encrypted.txt'

  $ruby ./lib/encrypt.rb './data/message_to_encrypt.txt' './translated/encrypted.txt'

  $ruby ./lib/decrypt.rb './data/message_hello_world.txt' './translated/decrypted.txt' 82648 240818

  $ruby ./lib/decrypt.rb './data/review_file' './translated/decrypted.txt' 82648 240818

  $ruby ./lib/decrypt.rb './data/message_hello_world_decrypt.txt' './translated/decrypted.txt' 02715 040895

 - Enigma - Enigma is the only class I have created. When calling a terminal command from the above list, an instance of the Enigma class is created. Then the Enigma class instance calls on a method from Messagable module, called "message_to_text", inside this method the file at ARGV[0] from the command line argument is processed through the encrypt, or decrypt method from back in the Enigma class.

 I felt pretty strong about the OOP section, so I hope my understanding and intuition isn't too far off.

#3.5 on Ruby Convention/Mechanics

- I feel like there is a lot of code. But, I also feel that for the way I did the project, it was not too far away from a necessary amount. I am excited to hear specific suggestions! I feel like Classes, methods, and variables are well named so that they clearly communicate their purpose. My code is all properly indented, and syntax is consistent. None of my methods are longer than 10 lines long. Most of my enumerables and data structures chosen are the most efficient tool for a given job that I was able to find, and I can speak as to why those enumerables and data structures were chosen.

#2.5 on TDD

- Disbelief of getting to 100% and then somehow it went back to 96.65% I think the 100% was an error I made of some kind. Finished with a 96.65% simple_cov when I run my rake test. I feel like I did a pretty good job of testing. Early on I should have put more of the tests I ran in pry, into my actual testing suite, so I had to go back and add some again later. Same with some tests coming from the command line. I have a few edge cases tested for, and a few mocks as well as a few stubs for randomness of user input, or of a generator.I would probably go with a 3 in testing, if I could get my simple coverage higher, But I spent the last 8 hours or so, not being able to figure how to test my new files created, form the program. Because of the 1 method I cannot figure how to test, for that - I am missing the 100% for simple_cov

# 4 on Version Control

- I definitely tried to make sure I was using version control early and often, and feel like I did a nice job of following along the project with my messages, which allow me to retrace the narrative in my mind of the projects progress, and find a place I want to re-visit, more easily.
