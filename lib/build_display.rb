# frozen_string_literal: true

# builds display for view
class Display
  attr_accessor :show_hangman_image
  attr_accessor :show_correctly_picked
  attr_accessor :show_letter_choices

  def initialize(game_data)
    @game_data = game_data
    @show_hangman_image = hangman_image(@game_data)
    @show_correctly_picked = correctly_picked(@game_data)
    @show_letter_choices = letter_choices(@game_data)
  end

  # Pulls the files with the hangman image based off of the number of remaining
  # guesses
  def hangman_image(game_data)
    case game_data.guesses_remaining
    when 5
      File.read('./lib/assets/five_remaining.txt')
    when 4
      File.read('./lib/assets/four_remaining.txt')
    when 3
      File.read('./lib/assets/three_remaining.txt')
    when 2
      File.read('./lib/assets/two_remaining.txt')
    when 1
      File.read('./lib/assets/one_remaining.txt')
    end
  end

  # Shows which letters have been correctly picked and subs a dash if it hasn't
  # been chosen yet
  def correctly_picked(game_data)
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
  def letter_choices(game_data)
    "USED LETTERS: #{game_data.chosen_letters}"
  end
end
