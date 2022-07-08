require 'rails_helper'

RSpec.describe 'Food page', type: :feature do
  before :each do
    @user = User.new(name: 'Chris', email: 'chris@gmail.com', password: 'asdasd')
    @user.save
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log In'
    visit root_path
  end

  it 'should be able to see Foods' do
    expect(page).to have_content('Foods')
  end

  it 'should be able to see a new food button' do
    expect(page).to have_content('New Food')
  end

  it 'should be able to see a new food form' do
    click_link 'New Food'
    expect(page).to have_content('Name')
    expect(page).to have_content('Calories')
    expect(page).to have_content('Carbs')
    expect(page).to have_content('Protein')
    expect(page).to have_content('Fat')
    expect(page).to have_content('Submit')
  end

  it 'should be able to create a new food' do
    click_link 'New Food'
    fill_in 'Name', with: 'Pizza'
    fill_in 'Calories', with: '200'
    fill_in 'Carbs', with: '20'
    fill_in 'Protein', with: '20'
    fill_in 'Fat', with: '20'
    click_button 'Submit'
    expect(page).to have_content('Pizza')
  end

  it 'should be able to see a food show page' do
    click_link 'New Food'
    fill_in 'Name', with: 'Pizza'
    fill_in 'Calories', with: '200'
    fill_in 'Carbs', with: '20'
    fill_in 'Protein', with: '20'
    fill_in 'Fat', with: '20'
    click_button 'Submit'
    click_link 'Pizza'
    expect(page).to have_content('Pizza')
    expect(page).to have_content('200')
    expect(page).to have_content('20')
    expect(page).to have_content('20')
    expect(page).to have_content('20')
  end
end
