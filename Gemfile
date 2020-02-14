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
  gem 'rerun'
  gem 'rubocop'
  gem 'sinatra-contrib'
end

group :development, :test do
  gem 'capybara'
  gem 'htmlbeautifier'
  gem 'pry'
  gem 'rack-test'
  gem 'rspec'
  gem 'selenium-webdriver'
  gem 'solargraph'
end
