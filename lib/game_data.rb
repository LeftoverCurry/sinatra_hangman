# frozen_string_literal: true

require 'json'
require './lib/magic_word.rb'
# contains information to run or save a game.
class GameData
  attr_accessor :user_name, :chosen_letters, :guesses_remaining
  attr_accessor :letters_left_to_guess, :randomly_picked_word

  def initialize(
    user_name,
    chosen_letters = [],
    guesses_remaining = 5,
    letters_left_to_guess = false,
    randomly_picked_word = []
  )
    @user_name = user_name
    @chosen_letters = chosen_letters
    @guesses_remaining = guesses_remaining
    @letters_left_to_guess = letters_left_to_guess
    @randomly_picked_word = randomly_picked_word
    create_magic_word(randomly_picked_word)
  end

  def create_magic_word(randomly_picked_word)
    return unless randomly_picked_word == []

    magic_word = MagicWord.new
    @letters_left_to_guess = magic_word.data
    @randomly_picked_word = magic_word.constant
  end

  def save
    info = { user_name: @user_name,
             chosen_letters: @chosen_letters,
             guesses_remaining: @guesses_remaining,
             letters_left_to_guess: @letters_left_to_guess,
             randomly_picked_word: @randomly_picked_word }

    filename = "./saved_games/#{@user_name}.json"
    File.open(filename, 'w') do |file|
      file.puts info.to_json
    end
  end

  def self.pull(user_name)
    saved_data = JSON.parse(File.read("./saved_games/#{user_name}.json"))
    new(
      saved_data['user_name'],
      saved_data['chosen_letters'],
      saved_data['guesses_remaining'],
      saved_data['letters_left_to_guess'],
      saved_data['randomly_picked_word']
    )
  end
end
