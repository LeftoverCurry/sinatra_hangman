# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/base'

get '/' do
  @message = 'testing'
  erb :home
end
