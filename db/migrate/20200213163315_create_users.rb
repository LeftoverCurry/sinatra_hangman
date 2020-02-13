# frozen_string_literal: true

# Creates the Users DB for saved game storage
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :chosen_letters, array: true
      t.integer :guesses_remaining
      t.string :letters_left_to_guess, array: true
      t.string :randomly_picked_word, array: true
    end
  end
end
