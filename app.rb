# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'

class App < Sinatra::Base
  get '/' do
    @message = 'Hello Megan!'
    erb :home
  end
end
