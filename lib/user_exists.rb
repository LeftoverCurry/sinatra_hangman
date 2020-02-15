# frozen_string_literal: true

def pull_or_create(user_name)
  if User.exists?(user_name: user_name)
    User.find_by(user_name: user_name)
  else
    # pick magic word
    magic_word = create_magic_word
    # create new user passing in name and magic word
    User.create(user_name: user_name, randomly_picked_word: magic_word,
                letters_left_to_guess: magic_word)
  end
end

private

def create_magic_word
  word_file = './lib/5desk.txt'
  @string = File.readlines(word_file).sample.strip.downcase
  @string.split('')
end
