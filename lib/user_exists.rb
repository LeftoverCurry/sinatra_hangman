# frozen_string_literal: true

def create_magic_word
  word_file = './lib/5desk.txt'
  @string = File.readlines(word_file).sample.strip.downcase
  @string.split('')
end

def create_new(user_name)
  # pick magic word
  magic_word = create_magic_word
  # create new user passing in name and magic word
  User.create(user_name: user_name, letters_left_to_guess: magic_word, randomly_picked_word: magic_word)
end
