module Hangman
  module Dictionary
    #WORDS = File.read("../linuxwords").split.to_a # reads in the file with a list of words and splits all the words and creates an array
    WORDS = ['testing']
    def self.random
      random_word = WORDS.sample
      while random_word.length < 5 || random_word.length >10 do
        random_word = WORDS.sample # this gets a random sample from the Words array
      end
      random_word # thats the word which will be passed to the game
    end
  end
end
