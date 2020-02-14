# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/base'
# require 'pry'
require './models/user.rb'
require './lib/user_exists.rb'
require './lib/build_display.rb'
require './lib/process_turn.rb'
enable :sessions

# Explicitly declares root file path so testing will search for the erb in the
# correct folder, instead of in /spec.
set :root, File.dirname(__FILE__)

# form for user name
get '/' do
  erb :home
end

# Pulls user name and varifies or sets up new game, redirects to /game passing
# parameters
post '/' do
  user_name = params[:user_name]
  session[:game_data] = pull_or_create(user_name)
  redirect '/game'
end

# Displays letters guessed, hangman, missing letters, correctly
# guessed letters and form for letter entry

get '/game' do
  game_data = session[:game_data]
  display = Display.new(game_data)
  @user_name = game_data.user_name.capitalize
  @show_hangman_image = display.show_hangman_image
  @show_correctly_picked = display.show_correctly_picked
  @show_letter_choices = display.show_letter_choices
  erb :game
end

# Determines if game was won and if not adjusts DB entry for current user
post '/game' do
  @guess = params[:guess].downcase
  @user_name = session[:game_data].user_name
  turn = Turn.new(session[:game_data], @guess)

  game_data = session[:game_data]
  if game_data.guesses_remaining <= 0
    redirect '/lose'
  elsif game_data.letters_left_to_guess == []
    redirect '/win'
  else
    redirect '/game'
  end
end

get '/win' do
  erb :win
end

get '/lose' do
  erb :lose
end
