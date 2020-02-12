# frozen_string_literal: true

require './spec/spec_helper.rb'

describe 'GET root' do
  it 'should allow accessing the home page' do
    get '/'
    visit('/')
  end

  it 'should display correctly' do
    get '/'
    expect(last_response.body).to include('Welcome to Hangman!')
  end
end

describe 'POST root' do
  before do
    post '/', user_name: 'testing'
  end

  it 'reads the param user_name and sets the session correctly' do
    expect(session['user_name']).to eq('testing')
  end

  it 'redirects to /game' do
    post '/'
    expect(last_response.status).to eq(302)
  end
end
