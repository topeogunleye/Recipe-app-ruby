require 'rails_helper'

RSpec.describe 'Recipe page', type: :feature do
  before :each do
    @user1 = User.new(name: 'Jerry', email: 'jerry@gmail.com', password: 'asdasd')
    @user1.save
    @user2 = User.new(name: 'Kero', email: 'kero@gmail.com', password: 'asdasd')
    @user2.save!
    @recipe1 = Recipe.new(name: 'Sushi', user_id: @user1.id)
    @recipe1.save!
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log In'
    visit recipes_path
  end

  it 'should be able to see Recipes' do
    expect(page).to have_content('Recipes')
  end


  it 'should be able to see a new recipe button' do
    expect(page).to have_content('New Recipe')
  end

  it 'should be able to see a new recipe form' do
    click_link 'New Recipe'
    expect(page).to have_content('Name')
    expect(page).to have_content('Ingredients')
    expect(page).to have_content('Instructions')
    expect(page).to have_content('Submit')
  end

  it 'should be able to create a new recipe' do
    click_link 'New Recipe'
    fill_in 'Name', with: 'Sushi'
    fill_in 'Ingredients', with: 'Sushi'
    fill_in 'Instructions', with: 'Sushi'
    click_button 'Submit'
    expect(page).to have_content('Sushi')
  end

  it 'should be able to see a recipe show page' do
    click_link 'New Recipe'
    fill_in 'Name', with: 'Sushi'
    fill_in 'Ingredients', with: 'Sushi'
    fill_in 'Instructions', with: 'Sushi'
    click_button 'Submit'
    click_link 'Sushi'
    expect(page).to have_content('Sushi')
    expect(page).to have_content('Sushi')
    expect(page).to have_content('Sushi')
  end
  