# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'activerecord'
gem 'activesupport'
gem 'pg'
gem 'rake'
gem 'sinatra'
gem 'sinatra-activerecord'

group :development do
  gem 'htmlbeautifier'
  gem 'rerun'
  gem 'rubocop'
  gem 'sinatra-contrib'
  gem 'solargraph'
end

group :development, :test do
  gem 'pry'
  gem 'rack-test'
  gem 'rspec'
end
