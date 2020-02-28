# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/base'
require './models/user.rb'
require './lib/user_exists.rb'
require './lib/build_display.rb'
require './lib/process_turn.rb'
require './models/user.rb'
require './lib/start_over.rb'
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
  session[:user_name] = params[:user_name]
  if User.exists?(user_name: session[:user_name])
    redirect '/returning_player'
  else
    session[:game_data] = create_new(session[:user_name])
    redirect '/game'
  end
end

# Determines if a player would like to continue and old game or delete it and start new.
get '/returning_player' do
  erb :returning_player
end

post '/returning_player' do
  response = params[:button]
  user_name = session[:user_name]
  if response == 'Continue!'
    session[:game_data] = User.find_by(user_name: session[:user_name])
  else
    start_over(user_name)
    session[:game_data] = create_new(user_name)
  end
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
  Turn.new(session[:game_data], @guess)
  user = User.find_by(user_name: @user_name)
  if user.guesses_remaining <= 0
    redirect '/lose'
  elsif user.letters_left_to_guess == []
    redirect '/win'
  else
    redirect '/game'
  end
end

get '/win' do
  @user_name = session[:game_data].user_name
  start_over(@user_name)
  erb :win
end

get '/lose' do
  @user_name = session[:game_data].user_name
  start_over(@user_name)
  erb :lose
end
