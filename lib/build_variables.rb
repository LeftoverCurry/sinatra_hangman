# frozen_string_literal: true

# builds game variables for view

def build_variables(_data)
  game_data = session[:data]
end

def show_correctly_picked(game_data)
  missing_letters = game_data.randomly_picked_word - game_data.chosen_letters
  display_array = []
  game_data.randomly_picked_word.each do |letter|
    display_array << if missing_letters.include? letter
                       ' _ '
                     else
                       " #{letter} "
                     end
  end
  display_array.join
end
