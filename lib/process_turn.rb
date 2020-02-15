# frozen_string_literal: true

# Processes a turn by the user
class Turn
  attr_accessor :guess
  attr_accessor :game_data
  def initialize(game_data, guess)
    @game_data = game_data
    @guess = guess
    increment(@guess)
    edit_letters_left(@guess)
    push_chosen_letter(@guess)
  end

  def push_chosen_letter(guess)
    return if @game_data.chosen_letters.include?(guess)

    new_data = @game_data.chosen_letters << guess
    user = User.find_by(user_name: @game_data.user_name)
    user.update(chosen_letters: new_data)
  end

  def increment(guess)
    return if @game_data.randomly_picked_word.include?(guess)

    new_data = @game_data.guesses_remaining -= 1
    user = User.find_by(user_name: @game_data.user_name)
    user.update(guesses_remaining: new_data)
  end

  def edit_letters_left(guess)
    return unless @game_data.letters_left_to_guess.include?(guess)

    new_data = game_data.letters_left_to_guess.delete(guess)
    user = User.find_by(user_name: @game_data.user_name)
    user.update(letters_left_to_guess: new_data)
  end
end
