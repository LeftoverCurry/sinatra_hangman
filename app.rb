# frozen_string_literal: true

require 'sinatra'

get '/' do
  @message = 'Hello Megan!'
  erb :home
end
