# frozen_string_literal: true

require './spec/spec_helper.rb'

describe 'application controllers' do
  it 'should allow accessing the home page' do
    get '/'
    visit('/')
  end

  it 'should pass the correct text into the body' do
    get '/'
    @message = 'testing'
    expect(last_response.body).to include('testing')
  end

  it 'should pass a user name back to the server' do
  end
end
