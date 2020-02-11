# frozen_string_literal: true

require './spec/spec_helper.rb'

describe 'application controllers' do
  it 'should allow accessing the home page' do
    get '/'
    expect(last_response).to be_ok
  end
end
