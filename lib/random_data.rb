module RandomData #standalone library - no dependencies or inheritance requirements. Modules => help keep common functions organized and reusable throughout our application. Can't insatiate or inherit from modules. Use them as mixins to add functions to multiple classes.
  #mixin = class that contains methods for use by other classes without having to be the parent class of those otehr classes.

  def self.random_paragraph
    sentences = []
    rand(4..6).times do #create 4-6 random sentences
      sentences << random_sentence #append the random sentences to sentences array.
    end

    sentences.join(" ") #combines ea sentence to a full paragraph, as a string
  end

  def self.random_sentence
    strings = []
    rand(3..8).times do
      strings << random_word #appends strings array with random_word
    end

    sentence = strings.join(" ") #putting the words together to form sentences
    sentence.capitalize << "." #capitalizes first letter
  end

  def self.random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0,rand(3..8)].join
  end
end
