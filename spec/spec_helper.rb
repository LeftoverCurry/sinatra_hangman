# frozen_string_literal: true

require 'rack/test'
require 'rspec'
require 'sinatra'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../app.rb', __dir__
require './config/environment.rb'

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
end
