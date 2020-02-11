# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'pry'

# Explicitly declares root file path so testing will search for the erb in the correct folder, instead of in /spec.
set :root, File.dirname(__FILE__)
# form for user name
get '/' do
  @message = 'testing'
  erb :home
end

# Pulls user name and varifies or sets up new game, redirects to /game passing
# parameters
post '/' do
end

# Displays letters guessed, hangman, missing letters, and correctly
# guessed letters

get '/game' do
  @user_name = session[:message]
  erb :game
end

# Determines if game was won and if not adjusts DB entry for current user
post '/game' do
  @user_name = params[:user_name]
  session[:message] = @user_name
  redirect '/game'
end
