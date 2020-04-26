module Hangman
  class Game
    attr_reader :chances, :word, :wrong_tries, :guess

    def initialize
      @chances = 5
      @wrong_tries = 0
      @guess = ""
      @word = Dictionary.random
    end

    def play
      Graphics.clear_screen
      puts 'Guess this word: ' + Graphics.obfuscate_word(word, '')

      while true
        print "[#{chances - wrong_tries} chances left]: "

        char = gets.chomp.downcase # to make sure that entered letters are lowercase

        Graphics.clear_screen
        if ( char == ''.to_s || !char.class == String || (/[^a-z]/).match(char) ) # to check that only letters are entered
          puts "You entered '#{char}', this is not a letter. Enter a letter please and not non-letter such as numbers or special characters. Try again:"
          char = gets.chomp

        elsif guess.include? char
          puts "You already entered '#{char}'. Please enter another letter."
          puts 'Try again: ' + Graphics.obfuscate_word(word, guess)
        elsif word.include? char

            guess << char
            placeholder = Graphics.obfuscate_word(word, guess)

            puts 'Whoop Whoop!! ' + placeholder


          unless placeholder.include? Graphics::OBFUSCATION_CHAR
            Graphics.clear_screen
            5.times do
              puts Graphics::ALIVE
              sleep(0.3)
              Graphics.clear_screen
              puts Graphics::DANCEARM
              sleep(0.3)
              Graphics.clear_screen
              puts Graphics::BOTHARMS
              sleep(0.3)
              Graphics.clear_screen
            end
            puts Graphics::ALIVE
            puts "\n\nWELL DONE!! YOU SURVIVED"
            break
          end
        else
            puts "OH NOES! The word doesn't contain '#{char}'"
            @wrong_tries = @wrong_tries + 1
            guess << char


          if wrong_tries == chances
            puts Graphics::DEAD
            puts "\nARRRRGGGGGGGGGGG YOU LOST! 😭  😵  ☠️"
            break
          else
            puts 'Try another: ' + Graphics.obfuscate_word(word, guess)
          end
        end
      end
    end
  end
end
