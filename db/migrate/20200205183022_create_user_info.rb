# frozen_string_literal: true

class CreateUserInfo < ActiveRecord::Migration[6.0]
  def change
    create_table :user_info do |t|
      t.string :user_name
      t.string :chosen_letters, array: true
      t.integer :guesses_remaining
      t.string :letters_left_to_guess, array: true
      t.string :randomly_picked_word, array: true
    end
  end
end
