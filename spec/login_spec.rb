require 'rails_helper'

RSpec.describe 'Log In page', type: :feature do
  before :each do
    @user = User.new(name: 'Tom', email: 'tom@gmail.com', password: 'asdasd')
    @user.save
    visit new_user_session_path
  end

  it 'I can see the input in login page' do
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_content('Log In')
  end

  it 'should be able to see food route' do
    expect(page).to have_content('Foods')fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log In'
    visit root_path
    expect(page).to have_content('Foods')
  end

end