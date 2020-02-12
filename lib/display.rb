# frozen_string_literal: true

# Runs the display for the game
class Display
  def initialize(game_data)
    @game_data = game_data
    puts hangman_image(@game_data)
    puts show_correctly_picked(@game_data)
    puts show_letter_choices(@game_data)
  end

  # Pulls the files with the hangman image based off of the number of remaining
  # guesses
  def hangman_image(game_data)
    case game_data.guesses_remaining
    when 5
      File.read('./views/five_remaining.txt')
    when 4
      File.read('./views/four_remaining.txt')
    when 3
      File.read('./views/three_remaining.txt')
    when 2
      File.read('./views/two_remaining.txt')
    when 1
      File.read('./views/one_remaining.txt')
    end
  end

  # Shows the bar with the correct letters and dashes for unguessed letters
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

  # Shows all off the letters the player has chosen
  def show_letter_choices(game_data)
    "USED LETTERS: #{game_data.chosen_letters}"
  end
end
