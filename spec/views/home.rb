# frozen_string_literal: true

require './spec/spec_helper.rb'

describe 'home view' do
  it 'should pass a user name back to the server' do
    get '/'
    fill_in('user_name', with: 'test')
    find('input[type=submit]').click
    expect(page).to have_current_path '/'
    expect(page.user_name).to eq('test')
  end
end
