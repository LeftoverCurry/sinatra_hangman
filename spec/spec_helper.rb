# frozen_string_literal: true

require 'rack/test'
require 'rspec'
require 'sinatra'
require 'capybara'
require 'capybara/dsl'
require File.expand_path '../app.rb', __dir__
require './config/environment.rb'

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end

RSpec.configure do |c|
  c.include RSpecMixin

  c.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  c.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  c.shared_context_metadata_behavior = :apply_to_host_groups

  c.include Capybara::DSL
end

Capybara.configure do |config|
  Capybara.app = Sinatra::Application
  config.run_server = false
  config.always_include_port = true
end
