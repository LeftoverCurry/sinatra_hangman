# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'activerecord'
gem 'sinatra-activerecord'
gem 'pg'
gem 'sinatra'
gem 'rake'

group :development do
  gem 'htmlbeautifier'
  gem 'rerun'
  gem 'rubocop'
  gem 'sinatra-contrib'
  gem 'solargraph'
end

group :development, :testing do
  gem 'pry'
  gem 'rspec'
end
