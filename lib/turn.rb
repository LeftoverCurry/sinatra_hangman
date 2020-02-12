# frozen_string_literal: true

require './lib/game_data.rb'
require './lib/display.rb'

# Takes a turn, inputting in the game data.
class Turn
  attr_accessor :game_data, :display

  # input and test_cond arguments are for testing purposes.
  # Input allows us to sub for user input, and the test condition allows us to
  # prevent recursion without user input.

  def initialize(game_data, input = false, test_cond = false)
    @test_cond = test_cond
    @game_data = game_data
    @display = show_display
    @input = user_response(input)
    check_for_valid_response(@input)
  end

  def show_display
    Display.new(game_data)
  end

  # allows input to be automated for testing
  def user_response(input)
    puts 'Please enter a letter or type "exit!" to save your game and exit:'
    if input == false
      gets.chomp.downcase
    else
      input
    end
  end

  # Checks #user_response for a valid response or allows the player to
  # save and exit
  def check_for_valid_response(resp)
    if resp == 'exit!'
      game_data.save
    elsif game_data.chosen_letters.include?(resp)
      repeat_response_query('repeat')
    elsif resp.length > 1
      repeat_response_query('multiple')
    else
      action(resp)
    end
  end

  # gives responses for failed conditions on user input
  def repeat_response_query(condition)
    if condition == 'repeat'
      puts 'You already chose that letter! Please choose another one:'
    elsif condition == 'multiple'
      puts 'Please only enter one letter!'
    end
    @input = user_response(false)
    check_for_valid_response(@input)
  end

  # Increments the number of guesses remaining or removes a letter from the list
  # of letters left to guess

  def action(resp)
    game_data.chosen_letters.push(resp)
    increment(resp)
    edit_letters_left(resp)
    win_or_lose
  end

  # Performs incrementation for #action
  def increment(resp)
    return if game_data.randomly_picked_word.include?(resp)

    game_data.guesses_remaining -= 1
  end

  # Performs letter editing for #action
  def edit_letters_left(resp)
    return unless game_data.letters_left_to_guess.include?(resp)

    game_data.letters_left_to_guess.delete(resp)
  end

  # Checks for a win or loss and performs their actions or continues to another
  # turn
  def win_or_lose
    if game_data.guesses_remaining.zero?
      puts File.read('./views/you_dead')
      puts File.read('./views/dead')
    elsif game_data.letters_left_to_guess == []
      puts File.read('./views/winscreen')
    else
      # allows us to break recursion if we are testing
      @test_cond == false ? Turn.new(game_data) : true
    end
  end
end

# game_data = GameData.pull('tester_info')
# Turn.new(game_data)
